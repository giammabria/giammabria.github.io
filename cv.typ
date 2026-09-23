#import "@preview/brilliant-cv:4.1.0": cv

// Three independent switches, all set with --input at compile time:
//
//   profile: "en" (default) | "it"          -- which language to render
//   variant: "public" (default) | "private" -- whether to overlay the real
//     contact details, photo, and referee names from the gitignored
//     private.toml
//   track: "supervision" (default) | "ds" | "de" -- which CV to render. ds
//     and de are English-only tech CVs built locally and never published;
//     each reads profile_en/tracks/<track>/track.toml.
//
// Both default to the safe value, so a bare `typst compile cv.typ` produces
// the public English CV. CI never passes `variant`, and private.toml is
// gitignored so it is not even present in a CI checkout -- see
// .github/workflows/build.yml.
#let profile = sys.inputs.at("profile", default: "en")
#let variant = sys.inputs.at("variant", default: "public")
#let profile-dir = "profile_" + profile + "/"
#let track = sys.inputs.at("track", default: "supervision")
#if track not in ("supervision", "ds", "de") {
  panic("unknown track '" + track + "': expected supervision, ds or de")
}
#if track != "supervision" and profile != "en" {
  panic("track '" + track + "' exists only in English: drop --input profile=" + profile)
}
#let track-dir = profile-dir + "tracks/" + track + "/"
#let track-data = if track != "supervision" {
  toml(track-dir + "track.toml")
} else {
  (:)
}

#let base-metadata = toml(profile-dir + "metadata.toml")

// Private overlay. `private.info` is merged over `[personal.info]`, so it
// adds email/phone and can override `location` with a full street address.
// The photo is opt-in: private.toml names its path under `photo`, and a
// private.toml without that key simply builds without a photo.
#let private-data = if variant == "private" {
  toml(profile-dir + "private.toml")
} else {
  (:)
}

#let metadata = if variant == "private" {
  let info = base-metadata.personal.info + private-data.at("info", default: (:))
  base-metadata + (personal: base-metadata.personal + (info: info))
} else {
  base-metadata
}

#let photo-path = private-data.at("photo", default: "")
#let profile-photo = if photo-path != "" { image(photo-path) } else { none }

// display_profile_photo is a static setting in the committed metadata.toml,
// so flip it here rather than duplicating the whole layout table in
// private.toml.
#let metadata = if profile-photo != none {
  // `+` must end the line, not start the next: in a code block a newline
  // ends the expression, and a leading `+` is then read as unary plus.
  metadata + (
    layout: metadata.layout + (
      header: metadata.layout.header + (display_profile_photo: true),
    ),
  )
} else {
  metadata
}

// Track overlay. A tech track replaces the headline and may tune flat
// layout keys; everything else, including the private overlay above, is
// shared with the supervision CV.
#let metadata = if track != "supervision" {
  metadata + (
    header_quote: track-data.header_quote,
    layout: metadata.layout + track-data.at("layout", default: (:)),
  )
} else {
  metadata
}

// Tech tracks only: brilliant-cv sets the header quote in medium-weight
// italic and entry locations and dates in oblique. Those stay upright, as in
// the supervision CV, whose build has no italic face at all. The tech builds
// add --font-path assets/fonts-italic for deliberate emphasis (tech.typ
// `honour`), a regular-weight italic that neither rule matches.
#show: body => if track == "supervision" {
  body
} else {
  show text.where(style: "oblique"): set text(style: "normal")
  show text.where(style: "italic", weight: "medium"): set text(style: "normal")
  body
}

// Hyperlinks read as clickable without shouting, tinted with the profile's
// own accent colour -- the way hyperref colours links in the LaTeX original.
#show link: it => text(fill: rgb(metadata.layout.awesome_color), it)

#show: cv.with(metadata, profile-photo: profile-photo)

#let import-modules(modules) = {
  for module in modules {
    include profile-dir + module + ".typ"
  }
}

#if track == "supervision" {
  import-modules(("professional", "education", "certificates", "skills"))
} else {
  for module in track-data.modules {
    include track-dir + module + ".typ"
  }
}

// GDPR processing consent. Kept out of `cv_footer` on purpose -- see the
// comment beside `gdpr_note` in metadata.toml.
#let gdpr-note = metadata.at("gdpr_note", default: "")
#if gdpr-note != "" {
  v(0.45em)
  align(center, text(size: 7.5pt, fill: luma(110), gdpr-note))
}

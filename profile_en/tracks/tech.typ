// Inline technology chip for the tech tracks' project descriptions. Same look
// as brilliant-cv's entry tags (its private _create-entry-tag-list), so the
// stack reads as tags without a separate tag row repeating the text.
#let tech(name) = box(
  inset: (x: 0.25em),
  outset: (y: 0.25em),
  fill: rgb("#ededee"),
  radius: 3pt,
  text(size: 8pt, name),
)

// Italic for an honour (Grande Distinction, Cum Laude). Regular-weight
// "italic" on purpose: cv.typ turns brilliant-cv's oblique and medium-italic
// runs upright, and this one must survive that.
#let honour(body) = text(style: "italic", body)

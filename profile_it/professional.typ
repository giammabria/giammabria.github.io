#import "@preview/brilliant-cv:4.1.0": cv-entry, cv-section

// I nomi delle referenze sono dati privati. Esistono solo nel private.toml
// gitignorato e vengono letti solo per una build locale con
// `--input variant=private`, quindi questo file committato non contiene
// nessun nome in chiaro e la build pubblica non rende alcuna referenza.
#let variant = sys.inputs.at("variant", default: "public")
#let references = if variant == "private" {
  toml("private.toml").at("references", default: ())
} else {
  ()
}

#let accent-color = rgb(toml("metadata.toml").layout.awesome_color)

// Takes one or more keys. Several referees at the same institution are
// rendered on a single line -- "Referenza: A, B -- Institution" -- rather than
// as one bullet each repeating the same employer.
#let ref-line(..keys) = {
  let matches = keys.pos().map(k => references.find(r => r.key == k)).filter(r => r != none)
  if matches.len() == 0 {
    none
  } else {
    let names = matches.map(r => if r.at("email", default: "") != "" {
      link("mailto:" + r.email)[#r.name]
    } else {
      [#r.name]
    })
    let joined = names.slice(1).fold(names.first(), (acc, n) => [#acc, #n])
    text(weight: "medium", fill: accent-color)[Referenza: #joined -- #matches.first().title]
  }
}

// `description` di cv-entry vuole una lista; ref-line restituisce `none` in
// una build pubblica, e un elemento `none` renderebbe un punto elenco vuoto.
#let bullets(..items) = list(..items.pos().filter(b => b != none))

#cv-section("Esperienza professionale")

#cv-entry(
  title: [Data analyst, vigilanza bancaria],
  society: [Banca Centrale Europea -- DG SPL],
  date: [07/2021 -- in corso],
  location: [Francoforte sul Meno, Germania],
  description: bullets(
    [Ideazione e realizzazione, con le autorità nazionali di 21 giurisdizioni, del *Registro outsourcing SSM* (110 SI): dizionari dei dati e standard di reporting in linea con DORA. I risultati sono confluiti nelle valutazioni SREP sul rischio operativo e nel monitoraggio del rischio di concentrazione sui fornitori terzi critici],
    [Coordinamento di iniziative BCE/EBA/NCA per la convergenza di vigilanza: *revisione tematica dei framework di governance* di circa 300 LSI in 21 giurisdizioni SSM, condotta insieme a Banca d'Italia e conclusa con raccomandazioni approvate dall'SMN; analisi dell'impatto e della trasposizione dell'*art. 21c CRD VI* negli Stati membri; stesura della *policy interna sui rischi delle online deposit platform* e sulla misurazione dell'esposizione degli enti; mappatura e quantificazione delle *cripto-attività e delle stablecoin* su tutte le LSI (MiCAR); referente BCE per Bulgaria e Portogallo],
    [Analisi orizzontali sul settore bancario europeo -- outsourcing, rischio ICT e cloud, rischio di concentrazione, esposizioni creditizie per singolo debitore, redditività e quote di mercato delle fintech -- basate su *strumenti di graph analytics e NLP* per entity resolution, identificazione dei fornitori di servizi e mappatura delle dipendenze da terze parti],
    [Progettazione e sviluppo di *pipeline ETL scalabili su AWS/Cloudera* (S3, Spark, Airflow): oltre 100 tabelle relative a tutte le 3.000 LSI dell'SSM, in crescita trimestrale, confluite in un data lab divisionale basato sugli standard SDMX, con sviluppo versionato su Git. L'infrastruttura ha ridotto i cicli di reportistica fino all'80%],
    [Sviluppo, testing e manutenzione di *tre pacchetti Python interni* per analisi statistica, segnalazioni di vigilanza ed estrazione dei dati, che hanno reso i flussi di lavoro più solidi, riutilizzabili ed efficienti],
    ref-line("ecb", "ecb2"),
  ),
)

#cv-entry(
  title: [Consulente, servizi finanziari e risk management],
  society: [Protiviti -- Risk Management],
  date: [10/2020 -- 06/2021],
  location: [Milano, Italia],
  description: bullets(
    [Definizione di *metodologie di valutazione del rischio e framework di reporting* per tre portafogli di private equity, con strumenti automatizzati per lo stress test dei piani industriali e la valutazione dei rischi operativi, strategici e finanziari di ogni società in portafoglio],
    [Sviluppo di *dashboard e reportistica di conformità* per due intermediari, per monitorarne l'allineamento alle linee guida BCE ed EBA],
    [Stesura, revisione e validazione di *policy e manuali sul rischio operativo e di credito*, a supporto delle strategie di mitigazione],
    ref-line("protiviti"),
  ),
)

Ecco una versione aggiornata del file `README.md` che include la specifica sulla parte di "acquisizione dati", evidenziando che è ancora in fase di sviluppo e che al momento utilizza un set di dati pre-acquisiti per simulare il funzionamento.

---

# EEG Data Visualizer

## Panoramica

Questa applicazione è stata sviluppata in MATLAB utilizzando **App Designer** come parte di un progetto di tesi all'interno di **BrainRestore**, un'iniziativa di ricerca volta a sviluppare un sistema BCI (Brain-Computer Interface) per la riabilitazione motoria di pazienti affetti da disturbi del sistema nervoso centrale.

L'applicazione consente di:
- **Visualizzare dati EEG pre-processati**: Esplorare i dati acquisiti in precedenza e applicare filtri per analisi avanzate.
- **Acquisire dati EEG in tempo reale** (funzionalità in fase di sviluppo): Registrare nuovi dati EEG durante l'esecuzione di task specifici. Al momento, per simulare il funzionamento, viene mostrato il plot di un set di dati già acquisiti.
- **Gestire informazioni sui soggetti**: Salvare i dettagli dei soggetti (età, sesso, mano dominante) e organizzare i dati in modo strutturato.
- **Salvare i risultati**: Memorizzare i dati acquisiti, i marker, i risultati dei questionari e le metriche di performance in file `.xlsx`.

Lo strumento è particolarmente utile per ricercatori e clinici che lavorano con dati EEG in sistemi BCI sia attivi che passivi.

---

## Indice

1. [Introduzione ai Sistemi BCI](#introduzione-ai-sistemi-bci)
2. [Contesto del Progetto: BrainRestore](#contesto-del-progetto-brainrestore)
3. [Funzionalità dell'Applicazione](#funzionalità-dellapplicazione)
4. [Installazione e Configurazione](#installazione-e-configurazione)
5. [Istruzioni per l'Uso](#istruzioni-per-luso)
6. [Struttura dei File](#struttura-dei-file)
7. [Contributi](#contributi)
8. [Licenza](#licenza)

---

## Introduzione ai Sistemi BCI

Un'**Interfaccia Cervello-Computer (BCI)** è un sistema che legge i cambiamenti volontari nell'attività cerebrale e traduce i segnali neurali in comandi computazionali in tempo reale. L'elettroencefalografia (EEG) è la tecnologia non invasiva più popolare per le applicazioni BCI, offrendo la possibilità di misurare direttamente l'attività neurale con un'elevata risoluzione temporale.

I sistemi BCI possono essere suddivisi in due tipologie principali:
- **BCI Attiva**: L'utente modula intenzionalmente la propria attività cerebrale per controllare un dispositivo o ricevere feedback.
- **BCI Passiva**: Il sistema monitora l'attività cerebrale per adattare l'interazione uomo-computer, spesso utilizzata per valutare il carico mentale o il livello di attenzione.

Il feedback è un aspetto cruciale dei sistemi BCI, poiché fornisce informazioni sulla prestazione e motiva l'utente a modulare in modo ottimale la propria attività cerebrale, aumentando l'attenzione e il coinvolgimento nel compito.

---

## Contesto del Progetto: BrainRestore

Il progetto **BrainRestore** mira a sviluppare un sistema BCI per la riabilitazione motoria di pazienti affetti da disturbi del sistema nervoso centrale. In particolare, il progetto ha valutato task motorio-cognitivi "Timed Up and Go" (TUG) per registrare segnali EEG, IMU e EMG. L'obiettivo è valutare il costo cognitivo di un dual-task motorio-cognitivo e, di conseguenza, valutare il carico mentale.

Per acquisire i segnali EEG è stato utilizzato il sistema portatile **Mindtooth Touch**, caratterizzato da:
- 8 elettrodi basati sull'utilizzo di acqua ("WET"), 5 frontali e 3 parietali.
- 2 elettrodi di riferimento e ground.
- Una frequenza di campionamento di 125 Hz.
- Tecnologia Bluetooth per l'invio dei dati in tempo reale.

---

## Funzionalità dell'Applicazione

### Schermata Principale (`main.mlapp`)
- Fornisce accesso a due funzionalità principali:
  - **Visualizza Dati EEG**: Naviga verso la schermata di visualizzazione dei dati.
  - **Acquisisci Dati EEG**: Naviga verso la schermata di acquisizione dei dati.

### Schermata di Visualizzazione Dati (`old_acquisition_update.mlapp`)
- Permette di:
  - Selezionare task, soggetto, canali, frequenza di campionamento, numero di canali e scala per la visualizzazione.
  - Applicare un filtro passa-banda specificando le frequenze di taglio (alta e bassa).
  - Avviare, mettere in pausa o fermare la visualizzazione dei dati.
  - Visualizzare le informazioni sul soggetto durante la visualizzazione.
  - Resettare gli input, chiudere l'applicazione o passare alla schermata di acquisizione.
- Legge i file `.set` dalla cartella `dataset_folder`. Questi file sono generati pre-processando i file `.csv` tramite lo script `codeEEG.m`.

### Schermata di Acquisizione Dati (`newAcquisition_update.mlapp`)
- **Nota Importante**: La funzionalità di acquisizione dati in tempo reale è attualmente in fase di sviluppo. Al momento, per simulare il funzionamento, quando si avvia l'acquisizione viene mostrato il plot di un set di dati già acquisiti. L'obiettivo futuro è quello di collegarsi a un dispositivo EEG (ad esempio, **Mindtooth Touch**) per acquisire e visualizzare dati in tempo reale.
- Permette di:
  - Aggiungere nuovi soggetti con dettagli (età, sesso, mano dominante) salvati in un file `.xlsx`.
  - Selezionare task, frequenza di campionamento, canali, numero di canali e scala per la visualizzazione.
  - Inserire marker durante l'acquisizione in base al task (counting, motor, dual task).
  - Fermare l'acquisizione e avviare un nuovo task per lo stesso soggetto o resettare i dati per un nuovo soggetto.
  - Salvare i dati acquisiti, i risultati dei questionari (NASA-TLX) e le metriche di performance dei task (ad esempio, conteggio degli errori) in file `.xlsx`.
- Organizza i file in una struttura gerarchica:
  ```
  EEG/
  ├── Task1/
  │   ├── Subject1/
  │   │   ├── File di dati
  │   ├── Subject2/
  │   │   ├── File di dati
  ├── Task2/
  │   ├── Subject1/
  │   │   ├── File di dati
  ```

---

## Installazione e Configurazione

### Prerequisiti
- MATLAB R2020b o versioni successive con i seguenti toolbox:
  - App Designer
  - Signal Processing Toolbox (per il filtraggio)
  - Spreadsheet Toolbox (per la gestione dei file `.xlsx`)


---

## Istruzioni per l'Uso

1. **Schermata Principale**:
   - Clicca su "Visualizza Dati" per navigare verso la schermata di visualizzazione.
   - Clicca su "Acquisisci Dati" per navigare verso la schermata di acquisizione.

2. **Visualizzazione Dati**:
   - Seleziona i parametri (task, soggetto, canali, ecc.).
   - Applica filtri se necessario.
   - Avvia la visualizzazione e monitora le informazioni sul soggetto.

3. **Acquisizione Dati**:
   - Aggiungi un nuovo soggetto o selezionane uno esistente.
   - Configura i parametri di acquisizione.
   - Avvia l'acquisizione.
   - Inserisci marker quando necessario.
   - Salva i dati e completa i questionari post-acquisizione.

---

## Struttura dei File

```
EEG-data-visualizer/
├── main.mlapp                  # Schermata principale dell'applicazione
├── old_acquisition_update.mlapp # Schermata di visualizzazione dati
├── newAcquisition_update.mlapp # Schermata di acquisizione dati
├── codeEEG.m                   # Script per il pre-processing dei file .csv
├── dataset_folder/             # Cartella contenente i file .set
├── EEG/                        # Cartella per salvare i dati acquisiti
│   ├── Task1/
│   │   ├── Subject1/
│   │   ├── Subject2/
│   ├── Task2/
│   │   ├── Subject1/
├── README.md                   # Questo file
```

---

## Licenza

Questo progetto è distribuito sotto licenza MIT. Vedi il file [LICENSE](LICENSE) per ulteriori dettagli.
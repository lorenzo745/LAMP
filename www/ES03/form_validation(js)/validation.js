// Eseguito al caricamento della pagina
window.onload = function () {
    // Recupera tutti gli elementi di input
    const input = document.getElementsByTagName("input");

    // Aggiunge un listener per ogni input per convalidare i dati all'evento "change"
    for (let i = 0; i < input.length; i++) {
        input[i].addEventListener("change", validateInput);
    }
}

// Funzione di validazione generica
function validateInput() {
    // Seleziona la validazione appropriata in base all'ordine degli input
    switch (this) {
        case input[0]: validateNome(this); break;
        case input[1]: validateCognome(this); break;
        case input[2]: validateData(this); break;
        case input[3]: validateCF(this); break;
        case input[4]: validateEmail(this); break;
        case input[5]: validateTel(this); break;
        case input[6]: validateVia(this); break;
        case input[7]: validateNCivico(this); break;
        case input[8]: validateCAP(this); break;
        case input[9]: validateComune(this); break;
        case input[10]: validateProvincia(this); break;
        case input[11]: validateUsername(this); break;
        case input[12]: validatePassword(this); break;
    }
}

// Funzioni di validazione per ciascun campo

function validateNome(elemento) {
    const nomeRegex = /^[a-zA-Zàèéìòùç\s]+$/; // Accetta lettere e caratteri speciali italiani
    applyValidation(elemento, nomeRegex);
}

function validateCognome(elemento) {
    const cognomeRegex = /^[a-zA-Zàèéìòùç\s'-]+$/; // Accetta lettere, apostrofi e trattini
    applyValidation(elemento, cognomeRegex);
}

function validateData(elemento) {
    const dataRegex = /^\d{4}-\d{2}-\d{2}$/; // Controlla il formato YYYY-MM-DD
    if (dataRegex.test(elemento.value)) {
        const [year, month, day] = elemento.value.split('-').map(Number);
        const isValidDate = year >= 1900 && year <= 2024 &&
                            month >= 1 && month <= 12 &&
                            day >= 1 && day <= 31;
        setValidationStyle(elemento, isValidDate);
    } else {
        setValidationStyle(elemento, false);
    }
}

function validateCF(elemento) {
    const cf = /^[A-Z]{6}\d{2}[A-Z]\d{2}[A-Z]\d{3}[A-Z]$/; // CF standard
    applyValidation(elemento, cf);
}

function validateEmail(elemento) {
    const email = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Email generica
    applyValidation(elemento, email);
}

function validateTel(elemento) {
    const tel = /^\d{10,15}$/; // Numeri tra 10 e 15 cifre
    applyValidation(elemento, tel);
}

function validateVia(elemento) {
    const via = /^[a-zA-Zàèéìòùç\s]+$/; // Solo lettere e spazi
    applyValidation(elemento, via);
}

function validateNCivico(elemento) {
    const ncivico = /^\d+$/; // Solo numeri
    applyValidation(elemento, ncivico);
}

function validateCAP(elemento) {
    const cap = /^\d{5}$/; // CAP italiano a 5 cifre
    applyValidation(elemento, cap);
}

function validateComune(elemento) {
    const comune = /^[a-zA-Zàèéìòùç\s]+$/; // Solo lettere e spazi
    applyValidation(elemento, comune);
}

function validateProvincia(elemento) {
    const provincia = /^[A-Z]{2}$/; // Due lettere maiuscole
    applyValidation(elemento, provincia);
}

function validateUsername(elemento) {
    const username = /^[a-zA-Z0-9]+$/; // Alfanumerico
    const isUnique = !elemento.value.toLowerCase().includes(input[0].value.toLowerCase()) &&
                     !elemento.value.toLowerCase().includes(input[1].value.toLowerCase());
    setValidationStyle(elemento, username.test(elemento.value) && isUnique);
}


function validatePassword(elemento) {
    const password = /^.{8,}$/; // Minimo 8 caratteri
    applyValidation(elemento, password);
}

// Funzioni di supporto

// Applica la validazione e aggiorna lo stile del bordo
function applyValidation(elemento, regex) {
    setValidationStyle(elemento, regex.test(elemento.value));
}

// Aggiorna il bordo in base alla validità
function setValidationStyle(elemento, isValid) {
    elemento.style.border = isValid ? '2px solid green' : '2px solid red';
}

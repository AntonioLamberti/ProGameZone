
function autocomplete(inp, arr) {
  /*la funzione di completamento automatico accetta due argomenti,
  l'elemento del campo di testo e un array di possibili valori completati automaticamente:*/
  var currentFocus;
  /*eseguire una funzione quando qualcuno scrive nel campo di testo:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*chiudi tutti gli elenchi già aperti di valori completati automaticamente*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*creare un elemento DIV che conterrà gli elementi (valori):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*aggiungi l'elemento DIV come figlio del contenitore di completamento automatico:*/
      this.parentNode.appendChild(a);
      /*per ogni elemento nell'array...*/
      for (i = 0; i < arr.length; i++) {
        /*controlla se l'elemento inizia con le stesse lettere del valore del campo di testo:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*crea un elemento DIV per ogni elemento corrispondente:*/
          b = document.createElement("DIV");
          /*rendi in grassetto le lettere corrispondenti:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*inserire un campo di input che conterrà il valore dell'elemento dell'array corrente:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*eseguire una funzione quando qualcuno fa clic sul valore dell'elemento (elemento DIV):*/
          b.addEventListener("click", function(e) {
              /*inserire il valore per il campo di testo di completamento automatico:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*chiudi l'elenco dei valori completati automaticamente,
              (o qualsiasi altro elenco aperto di valori completati automaticamente:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*eseguire una funzione premendo un tasto sulla tastiera:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*Se viene premuto il tasto freccia GI,
        aumentare la variabile currentFocus:*/
        currentFocus++;
        /*e e rendere più visibile l'elemento corrente:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*Se viene premuto il tasto freccia SU,
        diminuire la variabile currentFocus:*/
        currentFocus--;
        /*e e rendere più visibile l'elemento corrente:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*Se si preme il tasto INVIO, impedisce l'invio del modulo,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*e simula un clic sulla voce "attiva":*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*una funzione per classificare un articolo come "attivo":*/
    if (!x) return false;
    /*inizia rimuovendo la classe "attiva" su tutti gli elementi:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*aggiungi la classe "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*una funzione per rimuovere la classe "attiva" da tutti gli elementi di completamento automatico:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*chiudi tutti gli elenchi di completamento automatico nel documento,
    tranne quello passato come argomento:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*eseguire una funzione quando qualcuno fa clic nel documento:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

/*Un array contenente tutti i nomi dei giochi:*/
var countries = ["NieR Replicant","Pokémon spada","Tekken 7"];

/*avvia la funzione di completamento automatico sull'elemento "myInput" 
e passa lungo l'array dei giochi come possibili valori di completamento automatico:*/
autocomplete(document.getElementById("myInput"), countries);

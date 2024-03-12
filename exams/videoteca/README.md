# Videoteca - Esame finale

Un importante committente ha richiesto la realizzazione di un’app per accedere in modo semplice e veloce a tutto l’archivio della loro videoteca.

Sarà necessario sviluppare una pagina per mostrare la lista di tutti i film, ed una pagina per mostrare il dettaglio di ogni singolo film.

Il committente ha fornito due API, una per ottenere la lista dei film:

```
GET https://raw.githubusercontent.com/andrea689/flutter_course/main/exams/videoteca/movies
```

Ed un'altra API per ottenere il dettaglio del singolo film avente id `<MOVIE_ID>`:

```
GET https://raw.githubusercontent.com/andrea689/flutter_course/main/exams/videoteca/movie_details/<MOVIE_ID>
```

## Pagina 1 - Lista film

La pagina "Lista film" deve mostrare per ogni film:
- locandina (`poster_path`)
- titolo (`title`)
- data di uscita (`release_date`)
- voto medio (`vote_average`)

Inoltre è richiesto di aggiungere un tasto per ordinare la lista dei film in base al voto medio (crescente o decrescente)

Al click del singolo film bisognerà aprire la pagina "Dettaglio film"

## Pagina 2 - Dettaglio film

La pagina "Dettaglio film" deve mostrare:
- l'immagine di sfondo (`backdrop_path`)
- il titolo (`title`)
- il titolo originale (`original_title`) solo se è diverso dal titolo conosciuto in italia (`title`)
- descrizione (`overview`)
- data di uscita (`release_date`)
- voto medio (`vote_average`)
- numero di voti (`vote_count`)

### References

I 10 film sono stati presi dalle API di TMDB: https://developer.themoviedb.org/reference/discover-movie
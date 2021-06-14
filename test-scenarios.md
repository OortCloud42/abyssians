# Scenariusze testowe

## Użytkownik tworzy nowy zapis gry w którym wyświetlą się opcje nazwania zapisu oraz swojej postaci.

### Poprawne wykorzystanie:

-   Nazwanie zapisu i postaci zwykłymi literami oraz cyframi.

### Niepoprawne wykorzystanie:

-   Próby wstrzyknięcia własnego kodu przez puste pole na tekst, przeciążenie danych przez dziwne symbole.

## Gracz próbuje wcisnąć się w ścianę aby wyjść poza mapę.

### Przewidujemy:

-   Ściana po prostu zatrzyma gracza. (chyba, że dodamy mechanikę ukrytych pokojów i będzie to zabieg celowy. W takiej sytuacji gracz trafi do przewidzianego pomieszczenia.)

### Unikamy:

-   Gracz przechodzi przez ścianę i wychodzi poza mapę co pozwoli mu na ominięcie pewnych etapów gry bądź przyśpieszenie postępu.

## Gracz wykorzystuje mechanike przechodzenia przez pomieszczenia aby móc uniknąć walki lub zmienić położenie przeciwników na swoją korzyść.

### Przewidujemy:

-   Przywrócenie pomieszczenia do stanu pierwotnego odbierając graczowi rzeczy które w nim zdobył, karamy zachowanie poprzez utratę wszystkiego czego użył w danym pomieszczeniu
-   Zamknięcie pomieszczenia nie pozwalając graczowi na ucieczke

### Unikamy:

-   Pomijania walk przez zmianę pomieszczenia i kopiowania przedmiotów

## Gracz wskakuje na przeciwnika.

### Przewidujemy:

-   Otrzymanie obrażeń od przeciwnika.

### Unikamy:

-   Wskakiwania na przeciwnika i jazdy na nim. 

## Kolizja grzacza z przeciwnikiem:

### Oczekujemy:

-   Otrzymania obrażeń.

### Możliwe problemy:

-   Brak otrzymania obrażeń, dziwne błędy fizyki przeciwnika.

## Gracz posiada nieśmiertelność:

### Oczekujemy:

-   Gracz nie otrzymuje obrażeń, dodatkowo jest niewrażliwy na kolizje z przeciwnikami.

### Możliwe problemy:

-   Gracz mimo wszystko otrzymuje obrażenia.

## Gracz traci wszyskie życia:

### Oczekujemy:

-   Postać upada i nie może się ruszać. Możliwy jest tylko powrót do menu lub do ostatniego checkpointa.

### Możliwe problemy:

-   Gracz nadal żyje i może się poruszać. 

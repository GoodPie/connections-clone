import "@hotwired/turbo-rails"

const GUESS_DATA_ATTRIBUTE = "selected-guess";
const GUESS_BUTTON_CLASS = "guess-word";

const ID_DATA_ATTRIBUTE = "wordId"

// Colors for the state of the guess
const GUESS_SELECTED_COLOR = "bg-red-300";
const GUESS_NOT_SELECTED_COLOR = "bg-red-100";

const selectElement = (element: HTMLElement) => {
    element.classList.remove(GUESS_NOT_SELECTED_COLOR);
    element.classList.add(GUESS_SELECTED_COLOR);
    element.setAttribute(`data-${GUESS_DATA_ATTRIBUTE}`, "");
}

/**
 * Deselects an element from the selected guesses, removing the guess color and
 * @param element
 */
const deselectElement = (element: HTMLElement) => {
    element.classList.add(GUESS_NOT_SELECTED_COLOR);
    element.classList.remove(GUESS_SELECTED_COLOR);
    element.removeAttribute(`data-${GUESS_DATA_ATTRIBUTE}`);
}

const addNewGuess = (id: number) => {

    try {

        // First check if the current element needs to be de-selected
        const guessElement = document.getElementById(`guess-word-${id}`);
        if (!guessElement.hasAttribute(`data-${GUESS_DATA_ATTRIBUTE}`)) {


            const guessCount = parseInt((<HTMLInputElement> document.getElementById("max-guesses")).value, 10);
            const currentGuesses = document.querySelectorAll(`[${`data-${GUESS_DATA_ATTRIBUTE}`}]`).length;

            // Only make the guess if we haven't guess the max already
            if (currentGuesses < guessCount) {
                selectElement(guessElement);

                // Enable the button if guesses === guessCount
                if (currentGuesses + 1 === guessCount) {
                    (<HTMLInputElement> document.getElementById("submit-button")).disabled = false;
                }
            }

        } else {
            deselectElement(guessElement);

            // Always disable when we de-select
            (<HTMLInputElement> document.getElementById("submit-button")).disabled = true;
        }

    } catch (e) {
        console.error(e, id)
        alert(e);
    }



}



const initializeButtonOnClick = () => {
    document.querySelectorAll(`.${GUESS_BUTTON_CLASS}`).forEach((button: HTMLElement) => {
        button.addEventListener("click", () => {

            // The ID of the word should be attached to the data-attribute
            const wordId = button.dataset[ID_DATA_ATTRIBUTE];
            addNewGuess(parseInt(wordId, 10));
        })

    })
}

document.addEventListener("turbo:frame-render", () => {
    initializeButtonOnClick();
})
document.addEventListener('DOMContentLoaded', function () {
    const getPopup = this.querySelector(".main__popup")
    const getOverlay = this.querySelector(".main__popup__content")
    const getSubmit = this.querySelector(".main__popup__content__form__action .delete")
    this.querySelector(".main__popup__content__form__action .cancel").addEventListener("click", () => {
        this.querySelector("body").style.overflow = "scroll"
        getPopup.classList.remove("active")
    })
    this.addEventListener('click', function (event) {
        if (getPopup.classList.contains('active') && !getOverlay.contains(event.target)) {
            this.querySelector("body").style.overflow = "scroll"
            getPopup.classList.remove("active");
        }
    });

    this.querySelector(".main__popup__content__form__password input").addEventListener("input", (input) => {
        document.querySelector(".main__popup__content__form__password .error").classList.remove("active")
        if (input.target.value.length === 0) getSubmit.disabled = true
        else getSubmit.disabled = false
    })

    this.querySelector(".main__deleteAccount__right button").addEventListener("click", (event) => {
        event.stopPropagation()
        this.querySelector("body").style.overflow = "hidden"
        getPopup.classList.add("active");
    });

    getSubmit.addEventListener("click", () => {
        $.ajax({
            type: "DELETE",
            url: this.querySelector(".main__popup__content__form").action,
            data: {
                _token: this.querySelector(".main__popup__content__form input[name=_token]").value,
                password: this.querySelector(".main__popup__content__form__password input").value
            },
            success: function (response) {
                location.replace("/login")
            },
            error: function (error) {
                console.log(error);
                document.querySelector(".main__popup__content__form__password .error").classList.add("active")
            }
        });
    })
});
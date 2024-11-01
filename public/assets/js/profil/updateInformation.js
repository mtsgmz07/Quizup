$(document).ready(function () {
    const getInputNickname = document.querySelector(".main__editPersonnel__form__nickname input")
    const getInputEmail = document.querySelector(".main__editPersonnel__form__email input")
    const getSubmitInformation = document.querySelector(".main__editPersonnel__form__submit")
    document.addEventListener("input", () => {
        if (getInputNickname.value.length === 0 || getInputEmail.value.length === 0) getSubmitInformation.disabled = true
        else getSubmitInformation.disabled = false
    })

    getSubmitInformation.addEventListener("click", () => {
        alert(document.querySelector(".main__editPersonnel__form").action)
        $.ajax({
            type: "PATCH",
            url: document.querySelector(".main__editPersonnel__form").action,
            data: {
                _token: document.querySelector(".main__editPersonnel__form input[name=_token]").value,
                nickname: getInputNickname.value,
                email: getInputEmail.value
            },
            success: function (response) {
                document.querySelector(".main__editPersonnel__form__success").classList.add("active")
                setTimeout(() => {
                    document.querySelector(".main__editPersonnel__form__success").classList.remove("active")
                }, 5000)
            },
            error: function (error) {
                console.log(error, "erreur");
            }
        });
    })
});
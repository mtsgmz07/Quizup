$(document).ready(function () {
    const getInputCurrentPassword = document.querySelector(".main__editPassword__form__currentPassword input")
    const getInputNewPassword = document.querySelector(".main__editPassword__form__newPassword input")
    const getInputRetypePassword = document.querySelector(".main__editPassword__form__retypePassword input")
    const getSubmitInformation = document.querySelector(".main__editPassword__form__submit")
    document.addEventListener("input", () => {
        document.querySelector(".main__editPassword__form__currentPassword .error").classList.remove("active")
        if (getInputCurrentPassword.value.length === 0 || getInputNewPassword.value.length === 0 || getInputRetypePassword.value.length === 0) getSubmitInformation.disabled = true
        else if (
            (getInputNewPassword.value.length !== 0 && getInputRetypePassword.value.length !== 0) &&
            (getInputNewPassword.value === getInputRetypePassword.value)
        ) {
            document.querySelector(".main__editPassword__form__newPassword .error").classList.remove("active")
            document.querySelector(".main__editPassword__form__retypePassword .error").classList.remove("active")
            getSubmitInformation.disabled = false
        }
        else getSubmitInformation.disabled = true
    })

    console.log(document.querySelector(".main__editPassword__form").action);
    getSubmitInformation.addEventListener("click", () => {
        $.ajax({
            type: "PUT",
            url: document.querySelector(".main__editPassword__form").action,
            data: {
                _token: document.querySelector(".main__editPassword__form input[name=_token]").value,
                current_password: getInputCurrentPassword.value,
                password: getInputNewPassword.value,
                password_confirmation: getInputRetypePassword.value
            },
            success: function (response) {
                document.querySelector(".main__editPassword__form__success").classList.add("active")
                getSubmitInformation.disabled = true
                getInputCurrentPassword.value = ""
                getInputNewPassword.value = ""
                getInputRetypePassword.value = ""
                setTimeout(() => {
                    document.querySelector(".main__editPassword__form__success").classList.remove("active")
                }, 5000)
            },
            error: function (error) {
                console.log(error, "erreur");
                getSubmitInformation.disabled = true
                if (error.responseJSON.errors?.current_password?.[0]) document.querySelector(".main__editPassword__form__currentPassword .error").classList.add("active")

                if (error.responseJSON.errors?.password?.[0]) document.querySelector(".main__editPassword__form__newPassword .error").classList.add("active")

                if (error.responseJSON.errors?.password_confirmation?.[0]) document.querySelector(".main__editPassword__form__retypePassword .error").classList.add("active")
            }
        });
    })
});
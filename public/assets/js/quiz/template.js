const notyf = new Notyf({
    position: {
        x: 'center',
        y: 'top',
    },
    types: [
        {
            type: 'alert',
            background: '#6BBFBD',
            icon: false,
            duration: 3000
        }
    ]
});

document.querySelectorAll(".main__difficult__manager__container .favorite").forEach(container => {
    container.addEventListener("click", () => {
        const getQuizid = container.id.includes("_add") ? container.id.split("_add")[0] : container.id.split("_remove")[0]
        if (container.id.includes("_add")) {
            $.ajax({
                type: "POST",
                url: "/favorite/add",
                data: {
                    _token: document.querySelector(`.form${getQuizid} input[name=_token]`).value,
                    quizId: getQuizid
                },
                success: function (response) {
                    document.querySelector(`.form${getQuizid} i`).classList.replace("fa-regular", "fa-solid");
                    container.id = container.id.replace("_add", "_remove");
                    notyf.open({
                        type: 'success',
                        message: 'Ajouté aux favoris'
                    });
                },
                error: function (err) {
                    if (err.responseJSON.status === "favorite-already-added") notyf.open({
                        type: 'error',
                        message: '<p style="text-align:center">Ce quiz fait déjà partie de vos favoris</p>'
                    });
                    else notyf.open({
                        type: 'error',
                        message: '<p style="text-align:center">Veuillez-vous créer un compte</p>'
                    });
                }
            });
        } else {
            $.ajax({
                type: "POST",
                url: "/favorite/remove",
                data: {
                    _token: document.querySelector(`.form${getQuizid} input[name=_token]`).value,
                    quizId: getQuizid
                },
                success: function (response) {
                    document.querySelector(`.form${getQuizid} i`).classList.replace("fa-solid", "fa-regular");
                    container.id = container.id.replace("_remove", "_add");
                    notyf.open({
                        type: 'success',
                        message: 'Retiré des favoris'
                    });
                },
                error: function (err) {
                    console.log(err);
                    if (err.responseJSON.status === "favorite-not-added") notyf.open({
                        type: 'error',
                        message: '<p style="text-align:center">Ce quiz ne fait pas partie de vos favoris</p>'
                    });
                    else notyf.open({
                        type: 'error',
                        message: '<p style="text-align:center">Veuillez-vous créer un compte</p>'
                    });
                }
            });
        }

    })
})

document.querySelectorAll(".play").forEach((container) => {
    container.addEventListener("click", () => {
        $.ajax({
            type: "POST",
            url: "/quiz/game/create",
            data: {
                _token: document.querySelector(`.form${container.id} input[name=_token]`).value,
                quizId: container.id
            },
            success: function (response) {
                location.replace(response.url)
            },
            error: function (err) {
                console.log(err);
                if (err.responseJSON.status === "user-not-connected") location.replace(err.responseJSON.url)
                else notyf.open({
                    type: 'error',
                    message: '<p style="text-align:center">Une erreur vient se produire veuillez ressayer ultérieurement</p>'
                });
            }
        });
    })
})
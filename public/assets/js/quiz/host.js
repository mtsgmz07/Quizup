$(document).ready(function () {
    let disableBeforeunload = false
    document.querySelector(".main__game .launch").addEventListener("click", () => {
        $.ajax({
            type: "POST",
            url: "/quiz/game/launch",
            data: {
                _token: document.querySelector(".csrfToken").value
            },
            success: function (response) {
                disableBeforeunload = true
                location.reload()
            },
            error: function (err) {
                console.log(err);
            }
        });
    })

    // var redirectURL = null;
    // $("a").bind("click", function () {
    //     redirectURL = this.href;
    //     return true;
    // });

    // $(window).bind("beforeunload", function (event) {
    //     event.preventDefault();
    //     return 'Êtes-vous sûr de vouloir quitter cette page ?';
    // });

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

    document.querySelector(".main__code i").addEventListener("click", () => {
        navigator.clipboard.writeText(document.querySelector(".main__code h1").innerText);
        notyf.open({
            type: 'success',
            message: '<p style="text-align:center">Code copié dans le presse-papier.</p>'
        });
    })

    document.querySelector(".main__game .cancel").addEventListener("click", () => {
        if (confirm("Voulez-vous vraiment supprimé la partie ?")) {
            location.replace("/")
            $.ajax({
                type: "POST",
                url: "/quiz/game/destroy",
                data: {
                    _token: document.querySelector(".csrfToken").value
                },
                error: function (err) {
                    console.log(err);
                }
            });
        }
    })

    setInterval(() => {
        $.ajax({
            type: "POST",
            url: "/quiz/game/get/user",
            data: {
                _token: document.querySelector(".csrfToken").value
            },
            success: function (response) {
                let getGameManager = document.querySelector(".main__game__managers")
                let allUser = ""
                response.data.forEach(user => {
                    allUser += `
                    <div class="main__game__managers__user user{{ $userId }}">
                        <p>${user.nickname}</p>
                    </div>
                    `
                });
                getGameManager.innerHTML = allUser
            },
            error: function (err) {
                console.log(err);
            }
        });
    }, 1000)
});
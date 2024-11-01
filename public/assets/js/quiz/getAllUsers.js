setInterval(() => {
    $.ajax({
        type: "POST",
        url: "/quiz/game/get/user",
        data: {
            _token: document.querySelector(".getAllUsers").value
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
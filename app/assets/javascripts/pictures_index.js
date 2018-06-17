document.body.addEventListener('ajax:success', function (event) {
    var detail = event.detail
    var data = detail[0], status = detail[1], xhr = detail[2];

    var likeCount = document.getElementById('like-count')

    var oldLike = parseInt(likeCount.innerText.split(' ')[0])
    var newLike = oldLike + data.result

    var oldSuffix = likeCount.innerText.split(' ')[1]
    var newSuffix
    if(oldLike != 1 && newLike == 1) {
        newSuffix = oldSuffix.substring(0, oldSuffix.length - 1)
    } else if(oldLike == 1 && newLike == 0) {
        newSuffix = oldSuffix + 's'
    } else {
        newSuffix = oldSuffix
    }
    likeCount.innerText = newLike + ' ' + newSuffix
})
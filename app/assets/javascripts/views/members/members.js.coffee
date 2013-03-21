class Members
    foo : ->
        console.log 'just a test method'

Members.initSnapshotFunctionality  = ->
    canvas = $("#canvas")
    context = canvas[0].getContext("2d")
    video = $("#video")
    videoObj = {"video": true}
    errBack = (error) ->
        console.log("Video capture error: ", error.code)

    # Put video listeners into place
    if navigator.getUserMedia # Standard
        navigator.getUserMedia(videoObj, ((stream) ->
            video[0].src = stream
            video[0].play()
            ), errBack)
    else if navigator.webkitGetUserMedia # WebKit-prefixed
        navigator.webkitGetUserMedia(videoObj, ((stream) ->
            video[0].src = window.webkitURL.createObjectURL(stream)
            video[0].play()
            ), errBack)

    $("#snap").click ->
        context.drawImage(video[0], 0, 0, 320, 270)
        $("#picture").val(canvas[0].toDataURL().split(',')[1]) # TODO Not sure if this will work in other browsers

window.yogaSchool = {}
window.yogaSchool.Members = Members
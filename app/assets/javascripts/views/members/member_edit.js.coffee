$ ->
    canvas = $("#canvas")[0]
    context = canvas.getContext('2d')
    imageObj = new Image()
    imageObj.onload = ->
        console.log 'step 1'
        context.drawImage(imageObj, 0, 0)
        console.log 'step 2'
    imageObj.src = $("form").attr("action") + "/picture" # what a tricky thing
    yogaSchool.Members.initSnapshotFunctionality()
jQuery ->
  new PhotoCropper()

class PhotoCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1.2
      setSelect: [0,0, 600, 400]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#gallery_crop_x').val(coords.x)
    $('#gallery_crop_y').val(coords.y)
    $('#gallery_crop_w').val(coords.w)
    $('#gallery_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#preview').css
      width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
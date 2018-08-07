$ ->
  $dragDropArea = $('.drag-and-drop-area')

  # ProgressBar Class
  class ProgressBar
    constructor: (id) ->
      @id = id

    create: () ->
      $progressEl = $('<div></div>').addClass("progress  #{@id}")
      $barEl = $('<div></div>').attr('role', 'progressbar').attr('aria-valuenow', 0)
        .attr('aria-valuemin', 0).attr('aria-valuemax', 100).css('width', '0%')
        .text('0%').addClass("progress-bar #{@id}")
      $progressEl.append($barEl)
      $dragDropArea.find('.progress-bars').append($progressEl)

    progress: (value) ->
      $dragDropArea.find('.progress-bars').find(".progress-bar.#{@id}")
        .attr('aria-valuenow', value).css('width', "#{value}%").text("#{value}%")

    destroy: () ->
      $dragDropArea.find('.progress-bars').find(".progress.#{@id}").remove()

  # FileUploadingProcess Class
  class FileUploadingProcess
    constructor: () ->
      @fileuploading = {}

    ready: (data) ->
      $dragDropArea.find('.file-select').hide()
      progressId = "progress_id#{Math.random()}".replace('.', '')
      data['_progressId'] = progressId
      @fileuploading[progressId] = new ProgressBar(progressId)

    start: (data) ->
      @fileuploading[data['_progressId']].create()

    progress: (e, data) ->
      e['_progressId'] = data['_progressId']
      e.originalEvent.delegatedEvent['_progressId'] = data['_progressId']

    progressing: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      @fileuploading[e.originalEvent.delegatedEvent['_progressId']].progress(progress)

    finish: (data) ->
      @fileuploading[data['_progressId']].destroy()
      delete @fileuploading[data['_progressId']]
      if @areAllFinished()
        $dragDropArea.find('.file-select').show()

    areAllFinished: () ->
      Object.keys(@fileuploading).length == 0

    isProcessing: () ->
      $fileSelect = $dragDropArea.find('.file-select')
      $fileSelect.is(':hidden') #|| !!$fileSelect.attr('disabled')

  fileUploadingProcess = new FileUploadingProcess()
  $dragDropArea.find('.fileupload').fileupload({
    autoUpload: true,
    url: $dragDropArea.find('.fileupload').parents('form').attr('action'),
    type: 'PUT',
    dataType: 'json',
    add: (_, data) ->
      fileUploadingProcess.ready(data)
      data.submit()
    send: (_, data) ->
      fileUploadingProcess.start(data)
    progress: (e, data) ->
      fileUploadingProcess.progress(e, data)
    progressall: (e, data) ->
      fileUploadingProcess.progressing(e, data)
    done: (_, data) ->
      fileUploadingProcess.finish(data)
    fail: (_, data) ->
      fileUploadingProcess.finish(data)
  })

  $(document).on('click', '.file-select', (e) ->
    $dragDropArea = $(e.target).parents('.drag-and-drop-area')
    $dragDropArea.find('.fileupload').click()
    # removeClass because of app/assets/javascripts/admin/messages.js.coffee
    $dragDropArea.find('.file-select').removeClass('active')
  )

  $(document).on 'drop', '.drag-and-drop-area', (e) ->
    e.stopPropagation()
    e.preventDefault()
    $(this).removeClass('drag-and-drop-area-over')

    if !fileUploadingProcess.isProcessing() && e.originalEvent.dataTransfer && e.originalEvent.dataTransfer.files
      $dragDropArea.find('.fileupload').fileupload('add', { files: e.originalEvent.dataTransfer.files })

  $(document).on 'dragover', '.drag-and-drop-area', (e) ->
    e.stopPropagation()
    e.preventDefault()

    if !fileUploadingProcess.isProcessing()
      $(this).addClass('drag-and-drop-area-over')

  $(document).on 'dragleave', '.drag-and-drop-area', (e) ->
    e.stopPropagation()
    e.preventDefault()

    $(this).removeClass('drag-and-drop-area-over')

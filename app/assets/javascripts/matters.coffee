# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  # to set summernote object
  # You should change '#description' to your textarea input id
  
  summer_note = $("[id$=description]")

  # to call summernote editor
  summer_note.summernote
    # to set options
    height:300
    lang: 'ko-KR'
    # toolbar: [
                # ['insert', ['picture', 'link']], // no insert buttons
                # ["table", ["table"]],
                # ["style", ["style"]],
                # ["fontsize", ["fontsize"]],
                # ["color", ["color"]],
                # ["style", ["bold", "italic", "underline", "clear"]],
                # ["para", ["ul", "ol", "paragraph"]],
                # ["height", ["height"]],
                # ["help", ["help"]]
             #]

  # to set code for summernote
  summer_note.code summer_note.val()

  # to get code for summernote
  summer_note.closest('form').submit ->
    # alert $("[id$=description]").code()
    summer_note.val summer_note.code()
    true
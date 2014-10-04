# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

date = new Date()
hour = date.getHours()
if hour > 17
  now = 'night'
else
  now = 'day'
console.log "It is now #{now} time."

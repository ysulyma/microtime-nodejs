hrtime = process.hrtime!
milliseconds = +new Date
# compute delta
delta = milliseconds * Math.pow(10, 3) - to-microseconds hrtime

/* module exports */
module.exports =
  now: ->
    delta + to-microseconds process.hrtime!
  
  now-double: ->
    now-str = @now!to-string! # negative lengths do not work properly
    parse-float string-insert now-str, now-str.length - 6, \.
    
  now-struct: ->
    $_ = @now!to-string!match /^(.+)(.{6})$/
    [parse-int($_.1), parse-int($_.2)]
    
/* helper functions */
function to-microseconds([seconds, nanoseconds])
  parse-int (seconds.to-string! + zero-pad 9 nanoseconds.to-string!).slice 0 -3
    
function zero-pad(n, str)
  while str.length < n
    str = \0 + str
  str

function string-insert(str, index, insert-str)
  str.slice(0,index) + insert-str + str.slice index

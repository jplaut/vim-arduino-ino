let s:vim_arduino_version = '0.1.0'

" Load Once: {{{1
if exists("loaded_vim_arduino")
    finish
endif
let loaded_vim_arduino = 1

if !exists('g:vim_arduino_auto_open_serial')
  let g:vim_arduino_auto_open_serial = 0
endif

if !exists('g:vim_arduino_ino_cmd')
  let g:vim_arduino_ino_cmd = 'ino'
endif

if !exists('g:vim_arduino_serial_terminal_script')
  let g:vim_arduino_serial_terminal_script = 'vim-arduino-serial'
endif

let s:helper_dir = expand("<sfile>:h")

function! s:PrintStatus(result)
  if a:result == 0
    echohl Statement | echomsg "Succeeded." | echohl None
  else
    echohl WarningMsg | echomsg "Failed." | echohl None
  endif
endfunction

" Private: Compile or deploy code
"
" Returns nothing.
function! s:InvokeArduinoCli(deploy)
  call s:ArduinoKillMonitor()
  let l:flag = a:deploy ? "-d" : "-c"
  let l:f_name = expand('%:p')
  execute "w"
  if a:deploy
    echomsg "Compiling and deploying..." l:f_name
    let l:result = system(g:vim_arduino_ino_cmd . " build && " . g:vim_arduino_ino_cmd . " upload")
  else
    echomsg "Compiling..." l:f_name
    let l:result = system(g:vim_arduino_ino_cmd . " build")
  endif

  echo l:result
  call s:PrintStatus(v:shell_error)

  return !v:shell_error
endfunction

" Private: Release the /dev/tty.usb* port so we can recompile
"
" Returns nothing.
function! s:ArduinoKillMonitor()
  let output = system("screen -X -S" . g:vim_arduino_serial_terminal_script . "quit")
endfunction

" Public: Compile the current pde file.
"
" Returns nothing.
function! ArduinoCompile()
  call s:InvokeArduinoCli(0)
endfunction

" Public: Compile and Deploy the current pde file.
"
" Returns nothing.
function! ArduinoDeploy()
  call s:InvokeArduinoCli(1)

  " optionally auto open a serial port
  if g:vim_arduino_auto_open_serial
    call ArduinoSerialMonitor()
  endif
endfunction

" Public: Monitor a serial port
"
" Returns nothing.
function! ArduinoSerialMonitor()
  echo system(s:helper_dir."/".g:vim_arduino_serial_terminal_script)
endfunction

if !exists('g:vim_arduino_map_keys')
  let g:vim_arduino_map_keys = 1
endif

if g:vim_arduino_map_keys
  nnoremap <leader>ac :call ArduinoCompile()<CR>
  nnoremap <leader>ad :call ArduinoDeploy()<CR>
  nnoremap <leader>as :call ArduinoSerialMonitor()<CR>
endif

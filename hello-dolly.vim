function! GetRandom(size)
	if has('win32') || has('win32unix')
		execute '!cmd.exe /C "set /a \"rand=%random% % ' . a:size . '\""'
		let s:ran = getline(1)
	elseif has('unix')
		let s:ran = system('shuf -i 0-' . a:size . ' -n 1')
	endif
    return s:ran 
endfunction

let s:cwd = expand('<sfile>:p:h')
let s:lyrics = readfile(s:cwd . '/lyrics.txt')
let s:lineCount = len(s:lyrics)
let s:ranLine = s:lyrics[GetRandom(s:lineCount)]
echo s:ranLine

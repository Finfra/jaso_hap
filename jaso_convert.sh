#!/bin/bash
# source from https://github.com/Finfra/jaso_hap
# 모든 폴더의 분리된 한글을 합침.
# 본 코드는 한글이 포함되면 무조건 move 명령이 실행되는 버그가 있으나 사용에는 문제가 없음. 안정성을 위해 perl로 다시 만들어야 할 필요 있음.
# Managed by  https://github.com/Finfra/jaso_hap                        

echo 'Converting Started...'
for x in *; do 
	srcPath=`dirname ${BASH_SOURCE[0]}`
	t=`perl $srcPath/jaso_hap.pl $x`
	xl=${#x}
	let z=$xl-2
	#echo 1,${#t}, ${#x}
	if [[ ${#t} = ${#x} ]]; then
		echo $x
	else	
		echo $x → $t
		mv $x $t
	fi
done


# jaso_hap - Introduction

초성/중성/종성으로 분리된 한글을 합치기                               

# Version

v1.0.1

# usage 

    $ perl  jaso_hap.pl "ㄱㅛㅇㅠㄱ"                                 
    $ perl  jaso_hap.pl `cat 0.txt`                                  
    $ perl  jaso_hap.pl `cat 0.txt`>1.txt                            

# example
<code>[ ~/_sh]$ perl jaso_bunri.pl "핀프라</code>〈br /〉
<code>\> "</code>〈br /〉
<code>ㅍㅣㄴㅍㅡㄹㅏ</code>〈br /〉
<code>[ ~/_sh]$ </code>〈br /〉
<code>[ ~/_sh]$ perl jaso_hap.pl "ㅍㅣㄴㅍㅡㄹㅏ</code>〈br /〉
<code> "</code>〈br /〉
<code>핀프라</code>〈br /〉

# CF        

jaso_bunri.pl은 http://mwultong.blogspot.com/2006/03/perl.html 의 내용을 수정함.


# BUGS

Please report bugs to nowage[at]icloud.com.

# CONTRIBUTING

The github repository is at https://github.com/Finfra/jaso_hap.git

# SEE ALSO

Some other stuff.

# AUTHOR

NamJungGu, <nowage[at]icloud.com>

# COPYRIGHT AND LICENSE

(c) Copyright 2005-2014 by finfra.com

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
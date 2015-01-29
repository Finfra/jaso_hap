#!/usr/bin/perl
########################################################################
# 완성형 한글의 한글 문자열을 초성/중성/종성으로 분리하여 출력
# v1.0a
# Source From : http://mwultong.blogspot.com/2006/03/perl.html
########################################################################
use strict; use warnings;

# utf8 출력은 use encoding "cp949", STDOUT => "utf8";
# 인코딩을 euc-kr 로 하면 '똠' '힣' 등이 나오지 않음. MS의 euc-kr 은 사실상 cp949임.
# 한글 인코딩은 perlko 라는 펄 문서를 참조.
use encoding "utf8";





# 이것이 프로그램 본체
my $str=$ARGV[0];
utf8::upgrade($str);
LF2LFCR($str);
print hangul2jaso($str);




sub hangul2jaso { # 유니코드 한글 문자열을 입력 받음
  my ($a, $b, $c); # 자소 버퍼: 초성/중성/종성 순

                 # ㄱ      ㄲ      ㄴ      ㄷ      ㄸ      ㄹ      ㅁ      ㅂ      ㅃ      ㅅ      ㅆ      ㅇ      ㅈ      ㅉ      ㅊ      ㅋ      ㅌ      ㅍ      ㅎ
  my @ChoSung   = (0x3131, 0x3132, 0x3134, 0x3137, 0x3138, 0x3139, 0x3141, 0x3142, 0x3143, 0x3145, 0x3146, 0x3147, 0x3148, 0x3149, 0x314a, 0x314b, 0x314c, 0x314d, 0x314e);
                 # ㅏ      ㅐ      ㅑ      ㅒ      ㅓ      ㅔ      ㅕ      ㅖ      ㅗ      ㅘ      ㅙ      ㅚ      ㅛ      ㅜ      ㅝ      ㅞ      ㅟ      ㅠ      ㅡ      ㅢ      ㅣ
  my @JwungSung = (0x314f, 0x3150, 0x3151, 0x3152, 0x3153, 0x3154, 0x3155, 0x3156, 0x3157, 0x3158, 0x3159, 0x315a, 0x315b, 0x315c, 0x315d, 0x315e, 0x315f, 0x3160, 0x3161, 0x3162, 0x3163);
                 #         ㄱ      ㄲ      ㄳ      ㄴ      ㄵ      ㄶ      ㄷ      ㄹ      ㄺ      ㄻ      ㄼ      ㄽ      ㄾ      ㄿ      ㅀ      ㅁ      ㅂ      ㅄ      ㅅ      ㅆ      ㅇ      ㅈ      ㅊ      ㅋ      ㅌ      ㅍ      ㅎ
  my @JongSung  = (0,      0x3131, 0x3132, 0x3133, 0x3134, 0x3135, 0x3136, 0x3137, 0x3139, 0x313a, 0x313b, 0x313c, 0x313d, 0x313e, 0x313f, 0x3140, 0x3141, 0x3142, 0x3144, 0x3145, 0x3146, 0x3147, 0x3148, 0x314a, 0x314b, 0x314c, 0x314d, 0x314e);

  my @input_chars = unpack("U*", $_[0]); # 한글 유니코드 문자열을 16진수 배열로
  my $result;

  foreach (@input_chars) {
     # "AC00:가" ~ "D7A3:힣" 에 속한 글자면 분해.
     # regex로는 아스키 문자까지 한글로 오인함. 버그?
     if ($_ >= 0xAC00 && $_ <= 0xD7A3) {

        $c = $_ - 0xAC00;
        $a = $c / (21 * 28);
        $c = $c % (21 * 28);
        $b = $c / 28;
        $c = $c % 28;

        $a = int($a); $b = int($b); $c = int($c);
        $result .= chr($ChoSung[$a]) . chr($JwungSung[$b]);
        $result .= chr($JongSung[$c]) if ($c); # $c가 0이 아니면, 즉 받침이 있으면
     } else {
        $result .= chr($_);
     }
  }
  $result;
}


sub LF2LFCR {
  # 펄은, 파이프로 입력받으면 DOS 텍스트로 출력하고, DOS 파일로 입력받으면 UNIX 텍스트로 출력하는 등
  # 혼란스러운 면이 있는데, 이때 입력과 상관없이 무조건 DOS 텍스트로 출력케 하기 위한 함수
  $_[0] =~ s/\n/\r\n/g if ($_[0] !~ /\r\n/); # 도스 텍스트가 아니면
}
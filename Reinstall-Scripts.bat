@ECHO off

ECHO 통합팩 확장프로그램 재설치를 시작합니다.
ECHO 기존 확장프로그램을 삭제 후 직접 업데이트를 할 수 있도록 변경됩니다.
ECHO Extensions 폴더 안 파일중 직접 수정한 파일이 있을경우 백업 후 실행 바랍니다.
ECHO.
ECHO Version 0.65.1
pause

rmdir /s /q .\stable-diffusion-webui\extensions

ECHO.
ECHO.
ECHO 랜덤 스크립트 설치를 시작합니다
git clone "https://github.com/mkco5162/AI-WEBUI-scripts-Random" stable-diffusion-webui/extensions/AI-WEBUI-scripts-Random
git -C stable-diffusion-webui/extensions/AI-WEBUI-scripts-Random fetch
ECHO.
ECHO 다이나믹 프롬프트 설치를 시작합니다.
git clone "https://github.com/adieyal/sd-dynamic-prompts" stable-diffusion-webui/extensions/sd-dynamic-prompts
git -C stable-diffusion-webui/extensions/sd-dynamic-prompts fetch
ECHO.
ECHO 자동 태그완성 설치를 시작합니다.
git clone "https://github.com/DominikDoom/a1111-sd-webui-tagcomplete" stable-diffusion-webui/extensions/tag-autocomplete
git -C stable-diffusion-webui/extensions/tag-autocomplete fetch
ECHO.
ECHO 이미지 브라우저 설치를 시작합니다.
git clone "https://github.com/yfszzx/stable-diffusion-webui-images-browser" stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser
git -C stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser fetch
ECHO.
ECHO 한글패치 설치를 시작합니다.
git clone "https://github.com/36DB/stable-diffusion-webui-localization-ko_KR.git" stable-diffusion-webui/extensions/stable-diffusion-webui-localization-ko_KR
git -C stable-diffusion-webui/extensions/stable-diffusion-webui-localization-ko_KR fetch
pause
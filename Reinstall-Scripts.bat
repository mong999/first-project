@ECHO off

ECHO ������ Ȯ�����α׷� �缳ġ�� �����մϴ�.
ECHO ���� Ȯ�����α׷��� ���� �� ���� ������Ʈ�� �� �� �ֵ��� ����˴ϴ�.
ECHO Extensions ���� �� ������ ���� ������ ������ ������� ��� �� ���� �ٶ��ϴ�.
ECHO.
ECHO Version 0.65.1
pause

rmdir /s /q .\stable-diffusion-webui\extensions

ECHO.
ECHO.
ECHO ���� ��ũ��Ʈ ��ġ�� �����մϴ�
git clone "https://github.com/mkco5162/AI-WEBUI-scripts-Random" stable-diffusion-webui/extensions/AI-WEBUI-scripts-Random
git -C stable-diffusion-webui/extensions/AI-WEBUI-scripts-Random fetch
ECHO.
ECHO ���̳��� ������Ʈ ��ġ�� �����մϴ�.
git clone "https://github.com/adieyal/sd-dynamic-prompts" stable-diffusion-webui/extensions/sd-dynamic-prompts
git -C stable-diffusion-webui/extensions/sd-dynamic-prompts fetch
ECHO.
ECHO �ڵ� �±׿ϼ� ��ġ�� �����մϴ�.
git clone "https://github.com/DominikDoom/a1111-sd-webui-tagcomplete" stable-diffusion-webui/extensions/tag-autocomplete
git -C stable-diffusion-webui/extensions/tag-autocomplete fetch
ECHO.
ECHO �̹��� ������ ��ġ�� �����մϴ�.
git clone "https://github.com/yfszzx/stable-diffusion-webui-images-browser" stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser
git -C stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser fetch
ECHO.
ECHO �ѱ���ġ ��ġ�� �����մϴ�.
git clone "https://github.com/36DB/stable-diffusion-webui-localization-ko_KR.git" stable-diffusion-webui/extensions/stable-diffusion-webui-localization-ko_KR
git -C stable-diffusion-webui/extensions/stable-diffusion-webui-localization-ko_KR fetch
pause
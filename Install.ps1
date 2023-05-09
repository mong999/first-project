# Do not touch under this line
#Hash and download link

        $hash_full = "109d6da88eeba4e0f208033767279787"
        $download_hash_full = "https://huggingface.co/jcink0418/Arca/resolve/main/animefull-final-pruned.tar"

        $hash_sfw = "869f7e8c52082a34cf345e9c716b004f"
        $download_hash_sfw = "https://huggingface.co/jcink0418/Arca/resolve/main/animesfw-final-pruned.tar"

        $hash_full_sfw = "2c409f7860231023d81e0b38effca680"
        $download_hash_full_sfw = "https://huggingface.co/jcink0418/Arca/resolve/main/final-and-sfw.tar"

        $hash_full_latest = "c2b151440c7dca95ab67f9aea6745d7b"
        $download_hash_full_latest = "https://huggingface.co/jcink0418/Arca/resolve/main/animefull-latest.tar"

        $hash_sfw_latest = "d044eef8e02552fdf25e9e1dde5b776c"
        $download_hash_sfw_latest = "https://huggingface.co/jcink0418/Arca/resolve/main/animesfw-latest.tar"

        $hash_anything30 = "086079dd4cad2702b556d100de425523"
        $download_anything30 = "https://huggingface.co/jcink0418/Arca/resolve/main/Anything-V3.0.tar"

        $hash_anything30_pruned = "36aa8432e6a230c7543b1aca3ceaf373"
        $download_anything30_pruned = "https://huggingface.co/jcink0418/Arca/resolve/main/Anything-V3.0-pruned-fp16.tar"

function Install-git-repo {
    if (Test-Path -Path stable-diffusion-webui) {
        Write-Host "stable-diffusion-webui 폴더가 존재합니다"
        Write-Host "stable-diffusion-webui 폴더를 삭제하고 다시 실행해주세요"
        Write-Host "`n"
        Write-Host "프로그램을 종료합니다"
        Write-Host "`n"
        cmd.exe /c pause
        exit
    }
    else {
        Write-Host "GIT 레포지토리 클론을 시작합니다"
        Write-Host "`n"
        git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
        Write-Host "`n"
        Write-Host "`n"
    }
}


function ask-what-tar {
    Write-Host "`n"
    Write-Host "`n"
    Write-Host "<다운받을 학습모델을 선택해주세요>" -Foregroundcolor "Cyan"
    Write-Host "`n"
    Write-Host "0. 학습모델을 설치하지 않음 : 설치 후 수동으로 학습모델을 추가해야 정상이용 가능"
    Write-Host "1. animefull-final-pruned : 일반적인 상황. 일반짤 ~ R-18까지 광범위 하게 사용가능"
    Write-Host "2. animesfw-final-pruned : 일반짤 전용"
    Write-Host "3. animefull-final-pruned 및 animesfw-final-pruned : 두가지 다 설치 후 선택하여 사용가능"
    Write-Host "4. animefull-latest : 일반적인 상황. 일반짤 ~ R-18까지 광범위 하게 사용가능. 부정 프롬프트 도배시 사용"
    Write-Host "5. animesfw-latest : 일반짤 전용. 부정 프롬프트 도배시 사용"
    Write-Host "6. Anything-V3.0 : animefull-final-pruned 모델과 비슷하지만 이상하게 나올 확률이 조금 더 적은것으로 알려져 있음"
    Write-Host "7. Anything-V3.0-pruned-fp16 : Anything-V3.0 경량화 버전 (경량화에 따라 Anything-V3.0과 조금 다른 이미지가 나올 수 있음)"
    Write-Host "`n"
    Write-Host "`n"
    $Select_mainmenu = Read-Host "번호를 입력해 주시기 바랍니다 "
    Write-Host "`n"    
    Write-Host "`n"
    switch ($Select_mainmenu)
    {
        '0' {
            skip-model-download
        }
        '1' {
            download-full-tar
        }
        '2' {
            download-sfw-tar
        }
        '3' {
            download-full-sfw-tar
        }
        '4' {
            download-full-latest-tar
        }
        '5' {
            download-sfw-latest-tar
        }
        '6' {
            download-anything30
        }
        '7' {
            download-anything30-pruned
        }
        default {
            Write-Host "`n"
            Write-Host "`n"
            Write-Host "선택값이 없습니다 다시 선택해주시기 바랍니다" -Foregroundcolor "Green"
            Start-Sleep -Seconds 1.5
            ask-what-tar
        }
    }
}

function skip-model-download {
    Write-Host ""
    Write-Host "학습모델 및 VAE 설치를 생략합니다"
    Write-Host "학습모델이 없기 때문에 설치 후 학습모델이 없다는 에러가 뜹니다"
    Write-Host "수동으로 원하는 학습모델을 받아서 설치 후 사용하시기 바랍니다"
    Write-Host ""
}


function download-full-tar {
    if (Test-Path -Path animefull-final-pruned.tar) {
        Write-Host "animefull-final-pruned.tar이 이미 존재합니다"
        Write-Host "파일검사를 진행합니다"
        Write-Host "`n"
        $hash = (CertUtil -hashfile animefull-final-pruned.tar MD5)[1] -replace " ",""
        $hash_full = $hash_full
        $download_hash_full = $download_hash_full
        Write-Host $hash
        Write-Host "`n"
        if ($hash -eq $hash_full) {
            Write-Host "해쉬값이 일치합니다."
            Write-Host "파일 다운로드를 생략합니다"
            Write-Host "`n"
        }
        elseif ($hash -ne $hash_full) {
            Write-Host "해쉬값이 다릅니다!"
            Write-Host "`n"
            Write-Host "정상:"$hash_full
            Write-Host "현재:"$hash
            Write-Host "`n"
            Write-Host "파일 삭제 후 다운로드를 재시작합니다"
            Write-Host "`n"
            Write-Host "[파일 정보]`n  파일명: animefull-final-pruned.tar`n  용  량: 4.80GB"
            Write-Host "`n"
            del animefull-final-pruned.tar
            Invoke-WebRequest -Uri $download_hash_full -OutFile 'animefull-final-pruned.tar'
            Write-Host "파일 다운로드가 완료되었습니다"
            Write-Host "`n"
        }
        }
        else {
            Write-Host "파일이 존재하지 않습니다."
            Write-Host "파일 다운로드를 시작합니다."
            Write-Host "`n"
            Write-Host "[파일 정보]`n  파일명: animefull-final-pruned.tar`n  용  량: 4.80GB"
            Write-Host "`n"
            Invoke-WebRequest -Uri $download_hash_full -OutFile 'animefull-final-pruned.tar'
            Write-Host "파일 다운로드가 완료되었습니다"
            Write-Host "`n"

        }
    unzip-full-tar
}


function download-sfw-tar {
    if (Test-Path -Path animesfw-final-pruned.tar) {
        Write-Host "animesfw-final-pruned.tar이 이미 존재합니다"
        Write-Host "파일검사를 진행합니다"
        Write-Host "`n"
        $hash = (CertUtil -hashfile animesfw-final-pruned.tar MD5)[1] -replace " ",""
        $hash_sfw = $hash_sfw
        $download_hash_sfw = $download_hash_sfw
        Write-Host $hash
        Write-Host "`n"
        if ($hash -eq $hash_sfw) {
            Write-Host "해쉬값이 일치합니다."
            Write-Host "파일 다운로드를 생략합니다"
            Write-Host "`n"
        }
        elseif ($hash -ne $hash_sfw) {
            Write-Host "해쉬값이 다릅니다!"
            Write-Host "`n"
            Write-Host "정상:"$hash_sfw
            Write-Host "현재:"$hash
            Write-Host "`n"
            Write-Host "파일 삭제 후 다운로드를 재시작합니다"
            Write-Host "`n"
            Write-Host "[파일 정보]`n  파일명: animesfw-final-pruned.tar`n  용  량: 4.80GB"
            Write-Host "`n"
            del animesfw-final-pruned.tar
            Invoke-WebRequest -Uri $download_hash_sfw -OutFile 'animesfw-final-pruned.tar'
            Write-Host "파일 다운로드가 완료되었습니다"
            Write-Host "`n"
        }
        }
        else {
            Write-Host "파일이 존재하지 않습니다."
            Write-Host "파일 다운로드를 시작합니다."
            Write-Host "`n"
            Write-Host "[파일 정보]`n  파일명: animesfw-final-pruned.tar`n  용  량: 4.80GB"
            Write-Host "`n"
            Invoke-WebRequest -Uri $download_hash_sfw -OutFile 'animesfw-final-pruned.tar'
            Write-Host "파일 다운로드가 완료되었습니다"
            Write-Host "`n"

        }
    unzip-sfw-tar
}


function download-full-sfw-tar {
    if (Test-Path -Path final-and-sfw.tar) {
        Write-Host "final-and-sfw.tar이 이미 존재합니다"
        Write-Host "파일검사를 진행합니다"
        Write-Host "`n"
        $hash = (CertUtil -hashfile final-and-sfw.tar MD5)[1] -replace " ",""
        $hash_full_sfw = $hash_full_sfw
        Write-Host $hash
        Write-Host "`n"
        if ($hash -eq $hash_full_sfw) {
            Write-Host "해쉬값이 일치합니다."
            Write-Host "파일 다운로드를 생략합니다"
            Write-Host "`n"
        }
        elseif ($hash -ne $hash_full_sfw) {
            Write-Host "해쉬값이 다릅니다!"
            Write-Host "`n"
            Write-Host "정상:"$hash_full_sfw
            Write-Host "현재:"$hash
            Write-Host "`n"
            Write-Host "파일 삭제 후 다운로드를 재시작합니다"
            Write-Host "`n"
            Write-Host "[파일 정보]`n  파일명: final-and-sfw.tar`n  용  량: 9.53GB"
            Write-Host "`n"
            del final-and-sfw.tar
            Invoke-WebRequest -Uri $download_hash_full_sfw -OutFile 'final-and-sfw.tar'
            Write-Host "파일 다운로드가 완료되었습니다"
            Write-Host "`n"
        }
        }
        else {
            Write-Host "파일이 존재하지 않습니다."
            Write-Host "파일 다운로드를 시작합니다."
            Write-Host "`n"
            Write-Host "[파일 정보]`n  파일명: final-and-sfw.tar`n  용  량: 9.53GB"
            Write-Host "`n"
            Invoke-WebRequest -Uri $download_hash_full_sfw -OutFile 'final-and-sfw.tar'
            Write-Host "파일 다운로드가 완료되었습니다"
            Write-Host "`n"

        }
    unzip-full-sfw-tar
}


function download-full-latest-tar {
    if (Test-Path -Path animefull-latest.tar) {
        Write-Host "animefull-latest.tar이 이미 존재합니다"
        Write-Host "파일검사를 진행합니다"
        Write-Host "`n"
        $hash = (CertUtil -hashfile animefull-latest.tar MD5)[1] -replace " ",""
        $hash_full_latest = $hash_full_latest
        Write-Host $hash
        Write-Host "`n"
        if ($hash -eq $hash_full_latest) {
            Write-Host "해쉬값이 일치합니다."
            Write-Host "파일 다운로드를 생략합니다"
            Write-Host "`n"
        }
        elseif ($hash -ne $hash_full_latest) {
            Write-Host "해쉬값이 다릅니다!"
            Write-Host "`n"
            Write-Host "정상:"$hash_full_latest
            Write-Host "현재:"$hash
            Write-Host "`n"
            Write-Host "파일 삭제 후 다운로드를 재시작합니다"
            Write-Host "`n"
            Write-Host "[파일 정보]`n  파일명: animefull-latest.tar`n  용  량: 8.00GB"
            Write-Host "`n"
            del final-and-sfw.tar
            Invoke-WebRequest -Uri $download_hash_full_latest -OutFile 'animefull-latest.tar'
            Write-Host "파일 다운로드가 완료되었습니다"
            Write-Host "`n"
        }
        }
        else {
            Write-Host "파일이 존재하지 않습니다."
            Write-Host "파일 다운로드를 시작합니다."
            Write-Host "`n"
            Write-Host "[파일 정보]`n  파일명: animefull-latest.tar`n  용  량: 8.00GB"
            Write-Host "`n"
            Invoke-WebRequest -Uri $download_hash_full_sfw -OutFile 'animefull-latest.tar'
            Write-Host "파일 다운로드가 완료되었습니다"
            Write-Host "`n"

        }
    unzip-full-latest-tar
}


function download-sfw-latest-tar {
    if (Test-Path -Path animesfw-latest.tar) {
        Write-Host "animesfw-latest.tar이 이미 존재합니다"
        Write-Host "파일검사를 진행합니다"
        Write-Host "`n"
        $hash = (CertUtil -hashfile animesfw-latest.tar MD5)[1] -replace " ",""
        $hash_sfw_latest = $hash_sfw_latest
        Write-Host $hash
        Write-Host "`n"
        if ($hash -eq $hash_sfw_latest) {
            Write-Host "해쉬값이 일치합니다."
            Write-Host "파일 다운로드를 생략합니다"
            Write-Host "`n"
        }
        elseif ($hash -ne $hash_sfw_latest) {
            Write-Host "해쉬값이 다릅니다!"
            Write-Host "`n"
            Write-Host "정상:"$hash_sfw_latest
            Write-Host "현재:"$hash
            Write-Host "`n"
            Write-Host "파일 삭제 후 다운로드를 재시작합니다"
            Write-Host "`n"
            Write-Host "[파일 정보]`n  파일명: animesfw-latest.tar`n  용  량: 8.00GB"
            Write-Host "`n"
            del final-and-sfw.tar
            Invoke-WebRequest -Uri $download_hash_sfw_latest -OutFile 'animesfw-latest.tar'
            Write-Host "파일 다운로드가 완료되었습니다"
            Write-Host "`n"
        }
        }
        else {
            Write-Host "파일이 존재하지 않습니다."
            Write-Host "파일 다운로드를 시작합니다."
            Write-Host "`n"
            Write-Host "[파일 정보]`n  파일명: animesfw-latest.tar`n  용  량: 8.00GB"
            Write-Host "`n"
            Invoke-WebRequest -Uri $download_hash_sfw_latest -OutFile 'animesfw-latest.tar'
            Write-Host "파일 다운로드가 완료되었습니다"
            Write-Host "`n"

        }
    unzip-sfw-latest-tar
}


function download-anything30 {
    if (Test-Path -Path Anything-V3.0.tar) {
        Write-Host "Anything-V3.0.tar이 이미 존재합니다"
        Write-Host "파일검사를 진행합니다"
        Write-Host "`n"
        $hash = (CertUtil -hashfile Anything-V3.0.tar MD5)[1] -replace " ",""
        $hash_anything30 = $hash_anything30
        Write-Host $hash
        Write-Host "`n"
        if ($hash -eq $hash_anything30) {
            Write-Host "해쉬값이 일치합니다."
            Write-Host "파일 다운로드를 생략합니다"
            Write-Host "`n"
        }
        elseif ($hash -ne $hash_anything30) {
            Write-Host "해쉬값이 다릅니다!"
            Write-Host "`n"
            Write-Host "정상:"$hash_anything30
            Write-Host "현재:"$hash
            Write-Host "`n"
            Write-Host "파일 삭제 후 다운로드를 재시작합니다"
            Write-Host "`n"
            Write-Host "[파일 정보]`n  파일명: Anything-V3.0.tar`n  용  량: 7.94GB"
            Write-Host "`n"
            del Anything-V3.0.tar
            Invoke-WebRequest -Uri $download_anything30 -OutFile 'Anything-V3.0.tar'
            Write-Host "파일 다운로드가 완료되었습니다"
            Write-Host "`n"
        }
        }
        else {
            Write-Host "파일이 존재하지 않습니다."
            Write-Host "파일 다운로드를 시작합니다."
            Write-Host "`n"
            Write-Host "[파일 정보]`n  파일명: Anything-V3.0.tar`n  용  량: 7.94GB"
            Write-Host "`n"
            Invoke-WebRequest -Uri $download_anything30 -OutFile 'Anything-V3.0.tar'
            Write-Host "파일 다운로드가 완료되었습니다"
            Write-Host "`n"

        }
    unzip-anything30-tar
}


function download-anything30-pruned {
    if (Test-Path -Path Anything-V3.0-pruned-fp16.tar) {
        Write-Host "Anything-V3.0.tar이 이미 존재합니다"
        Write-Host "파일검사를 진행합니다"
        Write-Host "`n"
        $hash = (CertUtil -hashfile Anything-V3.0-pruned-fp16.tar MD5)[1] -replace " ",""
        $hash_anything30_pruned = $hash_anything30_pruned
        Write-Host $hash
        Write-Host "`n"
        if ($hash -eq $hash_anything30_pruned) {
            Write-Host "해쉬값이 일치합니다."
            Write-Host "파일 다운로드를 생략합니다"
            Write-Host "`n"
        }
        elseif ($hash -ne $hash_anything30_pruned) {
            Write-Host "해쉬값이 다릅니다!"
            Write-Host "`n"
            Write-Host "정상:"$hash_anything30_pruned
            Write-Host "현재:"$hash
            Write-Host "`n"
            Write-Host "파일 삭제 후 다운로드를 재시작합니다"
            Write-Host "`n"
            Write-Host "[파일 정보]`n  파일명: Anything-V3.0-pruned-fp16.tar`n  용  량: 2.75GB"
            Write-Host "`n"
            del Anything-V3.0.tar
            Invoke-WebRequest -Uri $download_anything30_pruned -OutFile 'Anything-V3.0-pruned-fp16.tar'
            Write-Host "파일 다운로드가 완료되었습니다"
            Write-Host "`n"
        }
        }
        else {
            Write-Host "파일이 존재하지 않습니다."
            Write-Host "파일 다운로드를 시작합니다."
            Write-Host "`n"
            Write-Host "[파일 정보]`n  파일명: Anything-V3.0-pruned-fp16.tar`n  용  량: 2.75GB"
            Write-Host "`n"
            Invoke-WebRequest -Uri $download_anything30_pruned -OutFile 'Anything-V3.0-pruned-fp16.tar'
            Write-Host "파일 다운로드가 완료되었습니다"
            Write-Host "`n"

        }
    unzip-anything30-pruned-tar
}


function unzip-full-tar {
    Write-Host "animesfw-final-pruned.tar 압축해제 합니다"
    Write-Host "`n"
    tar -zxvf .\animefull-final-pruned.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}

function unzip-sfw-tar {
    Write-Host "animesfw-final-pruned.tar 압축해제 합니다"
    Write-Host "`n"
    tar -zxvf .\animesfw-final-pruned.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}

function unzip-full-sfw-tar {
    Write-Host "final-and-sfw.tar 압축해제 합니다"
    Write-Host "`n"
    tar -zxvf .\final-and-sfw.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}

function unzip-full-latest-tar {
    Write-Host "animefull-latest.tar 압축해제 합니다"
    Write-Host "`n"
    tar -zxvf .\animefull-latest.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}

function unzip-sfw-latest-tar {
    Write-Host "animesfw-latest.tar 압축해제 합니다"
    Write-Host "`n"
    tar -zxvf .\animesfw-latest.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}

function unzip-anything30-tar {
    Write-Host "Anything-V3.0.tar 압축해제 합니다"
    Write-Host "`n"
    tar -zxvf .\Anything-V3.0.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}

function unzip-anything30-pruned-tar {
    Write-Host "Anything-V3.0-pruned-fp16.tar 압축해제 합니다"
    Write-Host "`n"
    tar -zxvf .\Anything-V3.0-pruned-fp16.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}

function install-settings {
    Write-Host "Settings.tar를 다운로드 합니다"
    Invoke-WebRequest -Uri "https://huggingface.co/jcink0418/Arca/resolve/main/Settings.tar" -OutFile 'Settings.tar'
    Write-Host "Settings.tar 압축해제 합니다"
    Write-Host "`n"
    tar -zxvf .\Settings.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}


function install-addon {
    Write-Host "`n"
    Write-Host "`n"
    Write-Host "애드온 설치를 시작합니다."
    Write-Host "`n"
    Write-Host "[현재 적용된 애드온]"
    Write-Host "  - 랜덤 스크립트"
    Write-Host "  - 와일드카드 태그"
    Write-Host "  - 이미지 브라우저"
    Write-Host "  - 자동 태그작성"
    Write-Host "  - 한글패치"

    $title    = '확인'
    $question = '애드온 설치를 진행하시겠습니까?'
    $choices  = '&Y - 예', '&N - 아니요'
    
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    if ($decision -eq 0) {
        Write-Host "`n"
        Write-Host "`n"
        Write-Host "애드온 설치를 시작합니다."
        Write-Host "`n"
        Write-Host "랜덤 스크립트 설치를 시작합니다"
        git clone "https://github.com/mkco5162/AI-WEBUI-scripts-Random" stable-diffusion-webui/extensions/AI-WEBUI-scripts-Random
        git -C stable-diffusion-webui/extensions/AI-WEBUI-scripts-Random fetch
        Write-Host "`n"
        Write-Host "다이나믹 프롬프트 설치를 시작합니다."
        git clone "https://github.com/adieyal/sd-dynamic-prompts" stable-diffusion-webui/extensions/sd-dynamic-prompts
        git -C stable-diffusion-webui/extensions/sd-dynamic-prompts fetch
        Write-Host "`n"
        Write-Host "자동 태그완성 설치를 시작합니다."
        git clone "https://github.com/DominikDoom/a1111-sd-webui-tagcomplete" stable-diffusion-webui/extensions/tag-autocomplete
        git -C stable-diffusion-webui/extensions/tag-autocomplete fetch
        Write-Host "`n"
        Write-Host "이미지 브라우저 설치를 시작합니다."
        git clone "https://github.com/yfszzx/stable-diffusion-webui-images-browser" stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser
        git -C stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser fetch
        Write-Host "`n"
        Write-Host "한글패치 설치를 시작합니다."
        git clone "https://github.com/36DB/stable-diffusion-webui-localization-ko_KR.git" stable-diffusion-webui/extensions/stable-diffusion-webui-localization-ko_KR
        git -C stable-diffusion-webui/extensions/stable-diffusion-webui-localization-ko_KR fetch
        Write-Host "`n"

    } else {
        Write-Host "`n"
        Write-Host "애드온 설치를 생략합니다."
        Write-Host "`n"
    }
}


function make-bat {
    Write-Host "실행기 설정을 시작합니다"
    Write-Host "`n"
    Write-Host "`n"
    Set-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx 이상).bat' '@echo off'
    Add-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx 이상).bat' ''
    Add-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx 이상).bat' 'set PYTHON='
    Add-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx 이상).bat' 'set GIT='
    Add-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx 이상).bat' 'set VENV_DIR='
    Add-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx 이상).bat' 'set COMMANDLINE_ARGS=--xformers --deepdanbooru --autolaunch'
    Add-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx 이상).bat' ''
    Add-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx 이상).bat' 'call webui.bat'


    Set-content '.\stable-diffusion-webui\webui-user-저사양용.bat' '@echo off'
    Add-content '.\stable-diffusion-webui\webui-user-저사양용.bat' ''
    Add-content '.\stable-diffusion-webui\webui-user-저사양용.bat' 'set PYTHON='
    Add-content '.\stable-diffusion-webui\webui-user-저사양용.bat' 'set GIT='
    Add-content '.\stable-diffusion-webui\webui-user-저사양용.bat' 'set VENV_DIR='
    Add-content '.\stable-diffusion-webui\webui-user-저사양용.bat' 'set COMMANDLINE_ARGS=--skip-torch-cuda-test --no-half --precision=full --lowvram --deepdanbooru --autolaunch'
    Add-content '.\stable-diffusion-webui\webui-user-저사양용.bat' ''
    Add-content '.\stable-diffusion-webui\webui-user-저사양용.bat' 'call webui.bat'


    Set-content '.\stable-diffusion-webui\webui-user.bat' '@echo off'
    Add-content '.\stable-diffusion-webui\webui-user.bat' ''
    Add-content '.\stable-diffusion-webui\webui-user.bat' 'set PYTHON='
    Add-content '.\stable-diffusion-webui\webui-user.bat' 'set GIT='
    Add-content '.\stable-diffusion-webui\webui-user.bat' 'set VENV_DIR='
    Add-content '.\stable-diffusion-webui\webui-user.bat' 'set COMMANDLINE_ARGS=--deepdanbooru --autolaunch'
    Add-content '.\stable-diffusion-webui\webui-user.bat' ''
    Add-content '.\stable-diffusion-webui\webui-user.bat' 'call webui.bat'

}

function run {
    Write-Host "`n"
    Write-Host "WEB UI 설치 및 실행을 시작합니다."
    Write-Host "Torch 와 Torchvision패키지는 설치에 시간이 오래 소요되니 끄지말고 기다려주세요"
    Write-Host "`n"
    Write-Host "`n"
    Write-Host "다음 실행때 부터는 " -nonewline; Write-Host "stable-diffusion-webui 폴더" -ForegroundColor "Cyan" -nonewline; Write-Host " 안에 있는" -nonewline; Write-Host " webui-user.bat" -ForegroundColor "Cyan" -nonewline; Write-Host "으로 실행해주시기 바랍니다."
    cd stable-diffusion-webui
    cmd.exe /c '.\webui-user.bat'
}

Write-Host "Version: 0.66.2"
Write-Host "WEB UI 설치 및 학습파일 적용을 시작합니다."
Write-Host "`n"
cmd.exe /c pause
Write-Host "`n"
Install-git-repo
#  ask-what-tar  모델 선택 skip
install-settings
install-addon
make-bat
run
cmd.exe /c pause
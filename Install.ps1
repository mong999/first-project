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
        Write-Host "stable-diffusion-webui ������ �����մϴ�"
        Write-Host "stable-diffusion-webui ������ �����ϰ� �ٽ� �������ּ���"
        Write-Host "`n"
        Write-Host "���α׷��� �����մϴ�"
        Write-Host "`n"
        cmd.exe /c pause
        exit
    }
    else {
        Write-Host "GIT �������丮 Ŭ���� �����մϴ�"
        Write-Host "`n"
        git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
        Write-Host "`n"
        Write-Host "`n"
    }
}


function ask-what-tar {
    Write-Host "`n"
    Write-Host "`n"
    Write-Host "<�ٿ���� �н����� �������ּ���>" -Foregroundcolor "Cyan"
    Write-Host "`n"
    Write-Host "0. �н����� ��ġ���� ���� : ��ġ �� �������� �н����� �߰��ؾ� �����̿� ����"
    Write-Host "1. animefull-final-pruned : �Ϲ����� ��Ȳ. �Ϲ�© ~ R-18���� ������ �ϰ� ��밡��"
    Write-Host "2. animesfw-final-pruned : �Ϲ�© ����"
    Write-Host "3. animefull-final-pruned �� animesfw-final-pruned : �ΰ��� �� ��ġ �� �����Ͽ� ��밡��"
    Write-Host "4. animefull-latest : �Ϲ����� ��Ȳ. �Ϲ�© ~ R-18���� ������ �ϰ� ��밡��. ���� ������Ʈ ����� ���"
    Write-Host "5. animesfw-latest : �Ϲ�© ����. ���� ������Ʈ ����� ���"
    Write-Host "6. Anything-V3.0 : animefull-final-pruned �𵨰� ��������� �̻��ϰ� ���� Ȯ���� ���� �� ���������� �˷��� ����"
    Write-Host "7. Anything-V3.0-pruned-fp16 : Anything-V3.0 �淮ȭ ���� (�淮ȭ�� ���� Anything-V3.0�� ���� �ٸ� �̹����� ���� �� ����)"
    Write-Host "`n"
    Write-Host "`n"
    $Select_mainmenu = Read-Host "��ȣ�� �Է��� �ֽñ� �ٶ��ϴ� "
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
            Write-Host "���ð��� �����ϴ� �ٽ� �������ֽñ� �ٶ��ϴ�" -Foregroundcolor "Green"
            Start-Sleep -Seconds 1.5
            ask-what-tar
        }
    }
}

function skip-model-download {
    Write-Host ""
    Write-Host "�н��� �� VAE ��ġ�� �����մϴ�"
    Write-Host "�н����� ���� ������ ��ġ �� �н����� ���ٴ� ������ ��ϴ�"
    Write-Host "�������� ���ϴ� �н����� �޾Ƽ� ��ġ �� ����Ͻñ� �ٶ��ϴ�"
    Write-Host ""
}


function download-full-tar {
    if (Test-Path -Path animefull-final-pruned.tar) {
        Write-Host "animefull-final-pruned.tar�� �̹� �����մϴ�"
        Write-Host "���ϰ˻縦 �����մϴ�"
        Write-Host "`n"
        $hash = (CertUtil -hashfile animefull-final-pruned.tar MD5)[1] -replace " ",""
        $hash_full = $hash_full
        $download_hash_full = $download_hash_full
        Write-Host $hash
        Write-Host "`n"
        if ($hash -eq $hash_full) {
            Write-Host "�ؽ����� ��ġ�մϴ�."
            Write-Host "���� �ٿ�ε带 �����մϴ�"
            Write-Host "`n"
        }
        elseif ($hash -ne $hash_full) {
            Write-Host "�ؽ����� �ٸ��ϴ�!"
            Write-Host "`n"
            Write-Host "����:"$hash_full
            Write-Host "����:"$hash
            Write-Host "`n"
            Write-Host "���� ���� �� �ٿ�ε带 ������մϴ�"
            Write-Host "`n"
            Write-Host "[���� ����]`n  ���ϸ�: animefull-final-pruned.tar`n  ��  ��: 4.80GB"
            Write-Host "`n"
            del animefull-final-pruned.tar
            Invoke-WebRequest -Uri $download_hash_full -OutFile 'animefull-final-pruned.tar'
            Write-Host "���� �ٿ�ε尡 �Ϸ�Ǿ����ϴ�"
            Write-Host "`n"
        }
        }
        else {
            Write-Host "������ �������� �ʽ��ϴ�."
            Write-Host "���� �ٿ�ε带 �����մϴ�."
            Write-Host "`n"
            Write-Host "[���� ����]`n  ���ϸ�: animefull-final-pruned.tar`n  ��  ��: 4.80GB"
            Write-Host "`n"
            Invoke-WebRequest -Uri $download_hash_full -OutFile 'animefull-final-pruned.tar'
            Write-Host "���� �ٿ�ε尡 �Ϸ�Ǿ����ϴ�"
            Write-Host "`n"

        }
    unzip-full-tar
}


function download-sfw-tar {
    if (Test-Path -Path animesfw-final-pruned.tar) {
        Write-Host "animesfw-final-pruned.tar�� �̹� �����մϴ�"
        Write-Host "���ϰ˻縦 �����մϴ�"
        Write-Host "`n"
        $hash = (CertUtil -hashfile animesfw-final-pruned.tar MD5)[1] -replace " ",""
        $hash_sfw = $hash_sfw
        $download_hash_sfw = $download_hash_sfw
        Write-Host $hash
        Write-Host "`n"
        if ($hash -eq $hash_sfw) {
            Write-Host "�ؽ����� ��ġ�մϴ�."
            Write-Host "���� �ٿ�ε带 �����մϴ�"
            Write-Host "`n"
        }
        elseif ($hash -ne $hash_sfw) {
            Write-Host "�ؽ����� �ٸ��ϴ�!"
            Write-Host "`n"
            Write-Host "����:"$hash_sfw
            Write-Host "����:"$hash
            Write-Host "`n"
            Write-Host "���� ���� �� �ٿ�ε带 ������մϴ�"
            Write-Host "`n"
            Write-Host "[���� ����]`n  ���ϸ�: animesfw-final-pruned.tar`n  ��  ��: 4.80GB"
            Write-Host "`n"
            del animesfw-final-pruned.tar
            Invoke-WebRequest -Uri $download_hash_sfw -OutFile 'animesfw-final-pruned.tar'
            Write-Host "���� �ٿ�ε尡 �Ϸ�Ǿ����ϴ�"
            Write-Host "`n"
        }
        }
        else {
            Write-Host "������ �������� �ʽ��ϴ�."
            Write-Host "���� �ٿ�ε带 �����մϴ�."
            Write-Host "`n"
            Write-Host "[���� ����]`n  ���ϸ�: animesfw-final-pruned.tar`n  ��  ��: 4.80GB"
            Write-Host "`n"
            Invoke-WebRequest -Uri $download_hash_sfw -OutFile 'animesfw-final-pruned.tar'
            Write-Host "���� �ٿ�ε尡 �Ϸ�Ǿ����ϴ�"
            Write-Host "`n"

        }
    unzip-sfw-tar
}


function download-full-sfw-tar {
    if (Test-Path -Path final-and-sfw.tar) {
        Write-Host "final-and-sfw.tar�� �̹� �����մϴ�"
        Write-Host "���ϰ˻縦 �����մϴ�"
        Write-Host "`n"
        $hash = (CertUtil -hashfile final-and-sfw.tar MD5)[1] -replace " ",""
        $hash_full_sfw = $hash_full_sfw
        Write-Host $hash
        Write-Host "`n"
        if ($hash -eq $hash_full_sfw) {
            Write-Host "�ؽ����� ��ġ�մϴ�."
            Write-Host "���� �ٿ�ε带 �����մϴ�"
            Write-Host "`n"
        }
        elseif ($hash -ne $hash_full_sfw) {
            Write-Host "�ؽ����� �ٸ��ϴ�!"
            Write-Host "`n"
            Write-Host "����:"$hash_full_sfw
            Write-Host "����:"$hash
            Write-Host "`n"
            Write-Host "���� ���� �� �ٿ�ε带 ������մϴ�"
            Write-Host "`n"
            Write-Host "[���� ����]`n  ���ϸ�: final-and-sfw.tar`n  ��  ��: 9.53GB"
            Write-Host "`n"
            del final-and-sfw.tar
            Invoke-WebRequest -Uri $download_hash_full_sfw -OutFile 'final-and-sfw.tar'
            Write-Host "���� �ٿ�ε尡 �Ϸ�Ǿ����ϴ�"
            Write-Host "`n"
        }
        }
        else {
            Write-Host "������ �������� �ʽ��ϴ�."
            Write-Host "���� �ٿ�ε带 �����մϴ�."
            Write-Host "`n"
            Write-Host "[���� ����]`n  ���ϸ�: final-and-sfw.tar`n  ��  ��: 9.53GB"
            Write-Host "`n"
            Invoke-WebRequest -Uri $download_hash_full_sfw -OutFile 'final-and-sfw.tar'
            Write-Host "���� �ٿ�ε尡 �Ϸ�Ǿ����ϴ�"
            Write-Host "`n"

        }
    unzip-full-sfw-tar
}


function download-full-latest-tar {
    if (Test-Path -Path animefull-latest.tar) {
        Write-Host "animefull-latest.tar�� �̹� �����մϴ�"
        Write-Host "���ϰ˻縦 �����մϴ�"
        Write-Host "`n"
        $hash = (CertUtil -hashfile animefull-latest.tar MD5)[1] -replace " ",""
        $hash_full_latest = $hash_full_latest
        Write-Host $hash
        Write-Host "`n"
        if ($hash -eq $hash_full_latest) {
            Write-Host "�ؽ����� ��ġ�մϴ�."
            Write-Host "���� �ٿ�ε带 �����մϴ�"
            Write-Host "`n"
        }
        elseif ($hash -ne $hash_full_latest) {
            Write-Host "�ؽ����� �ٸ��ϴ�!"
            Write-Host "`n"
            Write-Host "����:"$hash_full_latest
            Write-Host "����:"$hash
            Write-Host "`n"
            Write-Host "���� ���� �� �ٿ�ε带 ������մϴ�"
            Write-Host "`n"
            Write-Host "[���� ����]`n  ���ϸ�: animefull-latest.tar`n  ��  ��: 8.00GB"
            Write-Host "`n"
            del final-and-sfw.tar
            Invoke-WebRequest -Uri $download_hash_full_latest -OutFile 'animefull-latest.tar'
            Write-Host "���� �ٿ�ε尡 �Ϸ�Ǿ����ϴ�"
            Write-Host "`n"
        }
        }
        else {
            Write-Host "������ �������� �ʽ��ϴ�."
            Write-Host "���� �ٿ�ε带 �����մϴ�."
            Write-Host "`n"
            Write-Host "[���� ����]`n  ���ϸ�: animefull-latest.tar`n  ��  ��: 8.00GB"
            Write-Host "`n"
            Invoke-WebRequest -Uri $download_hash_full_sfw -OutFile 'animefull-latest.tar'
            Write-Host "���� �ٿ�ε尡 �Ϸ�Ǿ����ϴ�"
            Write-Host "`n"

        }
    unzip-full-latest-tar
}


function download-sfw-latest-tar {
    if (Test-Path -Path animesfw-latest.tar) {
        Write-Host "animesfw-latest.tar�� �̹� �����մϴ�"
        Write-Host "���ϰ˻縦 �����մϴ�"
        Write-Host "`n"
        $hash = (CertUtil -hashfile animesfw-latest.tar MD5)[1] -replace " ",""
        $hash_sfw_latest = $hash_sfw_latest
        Write-Host $hash
        Write-Host "`n"
        if ($hash -eq $hash_sfw_latest) {
            Write-Host "�ؽ����� ��ġ�մϴ�."
            Write-Host "���� �ٿ�ε带 �����մϴ�"
            Write-Host "`n"
        }
        elseif ($hash -ne $hash_sfw_latest) {
            Write-Host "�ؽ����� �ٸ��ϴ�!"
            Write-Host "`n"
            Write-Host "����:"$hash_sfw_latest
            Write-Host "����:"$hash
            Write-Host "`n"
            Write-Host "���� ���� �� �ٿ�ε带 ������մϴ�"
            Write-Host "`n"
            Write-Host "[���� ����]`n  ���ϸ�: animesfw-latest.tar`n  ��  ��: 8.00GB"
            Write-Host "`n"
            del final-and-sfw.tar
            Invoke-WebRequest -Uri $download_hash_sfw_latest -OutFile 'animesfw-latest.tar'
            Write-Host "���� �ٿ�ε尡 �Ϸ�Ǿ����ϴ�"
            Write-Host "`n"
        }
        }
        else {
            Write-Host "������ �������� �ʽ��ϴ�."
            Write-Host "���� �ٿ�ε带 �����մϴ�."
            Write-Host "`n"
            Write-Host "[���� ����]`n  ���ϸ�: animesfw-latest.tar`n  ��  ��: 8.00GB"
            Write-Host "`n"
            Invoke-WebRequest -Uri $download_hash_sfw_latest -OutFile 'animesfw-latest.tar'
            Write-Host "���� �ٿ�ε尡 �Ϸ�Ǿ����ϴ�"
            Write-Host "`n"

        }
    unzip-sfw-latest-tar
}


function download-anything30 {
    if (Test-Path -Path Anything-V3.0.tar) {
        Write-Host "Anything-V3.0.tar�� �̹� �����մϴ�"
        Write-Host "���ϰ˻縦 �����մϴ�"
        Write-Host "`n"
        $hash = (CertUtil -hashfile Anything-V3.0.tar MD5)[1] -replace " ",""
        $hash_anything30 = $hash_anything30
        Write-Host $hash
        Write-Host "`n"
        if ($hash -eq $hash_anything30) {
            Write-Host "�ؽ����� ��ġ�մϴ�."
            Write-Host "���� �ٿ�ε带 �����մϴ�"
            Write-Host "`n"
        }
        elseif ($hash -ne $hash_anything30) {
            Write-Host "�ؽ����� �ٸ��ϴ�!"
            Write-Host "`n"
            Write-Host "����:"$hash_anything30
            Write-Host "����:"$hash
            Write-Host "`n"
            Write-Host "���� ���� �� �ٿ�ε带 ������մϴ�"
            Write-Host "`n"
            Write-Host "[���� ����]`n  ���ϸ�: Anything-V3.0.tar`n  ��  ��: 7.94GB"
            Write-Host "`n"
            del Anything-V3.0.tar
            Invoke-WebRequest -Uri $download_anything30 -OutFile 'Anything-V3.0.tar'
            Write-Host "���� �ٿ�ε尡 �Ϸ�Ǿ����ϴ�"
            Write-Host "`n"
        }
        }
        else {
            Write-Host "������ �������� �ʽ��ϴ�."
            Write-Host "���� �ٿ�ε带 �����մϴ�."
            Write-Host "`n"
            Write-Host "[���� ����]`n  ���ϸ�: Anything-V3.0.tar`n  ��  ��: 7.94GB"
            Write-Host "`n"
            Invoke-WebRequest -Uri $download_anything30 -OutFile 'Anything-V3.0.tar'
            Write-Host "���� �ٿ�ε尡 �Ϸ�Ǿ����ϴ�"
            Write-Host "`n"

        }
    unzip-anything30-tar
}


function download-anything30-pruned {
    if (Test-Path -Path Anything-V3.0-pruned-fp16.tar) {
        Write-Host "Anything-V3.0.tar�� �̹� �����մϴ�"
        Write-Host "���ϰ˻縦 �����մϴ�"
        Write-Host "`n"
        $hash = (CertUtil -hashfile Anything-V3.0-pruned-fp16.tar MD5)[1] -replace " ",""
        $hash_anything30_pruned = $hash_anything30_pruned
        Write-Host $hash
        Write-Host "`n"
        if ($hash -eq $hash_anything30_pruned) {
            Write-Host "�ؽ����� ��ġ�մϴ�."
            Write-Host "���� �ٿ�ε带 �����մϴ�"
            Write-Host "`n"
        }
        elseif ($hash -ne $hash_anything30_pruned) {
            Write-Host "�ؽ����� �ٸ��ϴ�!"
            Write-Host "`n"
            Write-Host "����:"$hash_anything30_pruned
            Write-Host "����:"$hash
            Write-Host "`n"
            Write-Host "���� ���� �� �ٿ�ε带 ������մϴ�"
            Write-Host "`n"
            Write-Host "[���� ����]`n  ���ϸ�: Anything-V3.0-pruned-fp16.tar`n  ��  ��: 2.75GB"
            Write-Host "`n"
            del Anything-V3.0.tar
            Invoke-WebRequest -Uri $download_anything30_pruned -OutFile 'Anything-V3.0-pruned-fp16.tar'
            Write-Host "���� �ٿ�ε尡 �Ϸ�Ǿ����ϴ�"
            Write-Host "`n"
        }
        }
        else {
            Write-Host "������ �������� �ʽ��ϴ�."
            Write-Host "���� �ٿ�ε带 �����մϴ�."
            Write-Host "`n"
            Write-Host "[���� ����]`n  ���ϸ�: Anything-V3.0-pruned-fp16.tar`n  ��  ��: 2.75GB"
            Write-Host "`n"
            Invoke-WebRequest -Uri $download_anything30_pruned -OutFile 'Anything-V3.0-pruned-fp16.tar'
            Write-Host "���� �ٿ�ε尡 �Ϸ�Ǿ����ϴ�"
            Write-Host "`n"

        }
    unzip-anything30-pruned-tar
}


function unzip-full-tar {
    Write-Host "animesfw-final-pruned.tar �������� �մϴ�"
    Write-Host "`n"
    tar -zxvf .\animefull-final-pruned.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}

function unzip-sfw-tar {
    Write-Host "animesfw-final-pruned.tar �������� �մϴ�"
    Write-Host "`n"
    tar -zxvf .\animesfw-final-pruned.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}

function unzip-full-sfw-tar {
    Write-Host "final-and-sfw.tar �������� �մϴ�"
    Write-Host "`n"
    tar -zxvf .\final-and-sfw.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}

function unzip-full-latest-tar {
    Write-Host "animefull-latest.tar �������� �մϴ�"
    Write-Host "`n"
    tar -zxvf .\animefull-latest.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}

function unzip-sfw-latest-tar {
    Write-Host "animesfw-latest.tar �������� �մϴ�"
    Write-Host "`n"
    tar -zxvf .\animesfw-latest.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}

function unzip-anything30-tar {
    Write-Host "Anything-V3.0.tar �������� �մϴ�"
    Write-Host "`n"
    tar -zxvf .\Anything-V3.0.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}

function unzip-anything30-pruned-tar {
    Write-Host "Anything-V3.0-pruned-fp16.tar �������� �մϴ�"
    Write-Host "`n"
    tar -zxvf .\Anything-V3.0-pruned-fp16.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}

function install-settings {
    Write-Host "Settings.tar�� �ٿ�ε� �մϴ�"
    Invoke-WebRequest -Uri "https://huggingface.co/jcink0418/Arca/resolve/main/Settings.tar" -OutFile 'Settings.tar'
    Write-Host "Settings.tar �������� �մϴ�"
    Write-Host "`n"
    tar -zxvf .\Settings.tar -C .\
    Write-Host "`n"
    Write-Host "`n"
}


function install-addon {
    Write-Host "`n"
    Write-Host "`n"
    Write-Host "�ֵ�� ��ġ�� �����մϴ�."
    Write-Host "`n"
    Write-Host "[���� ����� �ֵ��]"
    Write-Host "  - ���� ��ũ��Ʈ"
    Write-Host "  - ���ϵ�ī�� �±�"
    Write-Host "  - �̹��� ������"
    Write-Host "  - �ڵ� �±��ۼ�"
    Write-Host "  - �ѱ���ġ"

    $title    = 'Ȯ��'
    $question = '�ֵ�� ��ġ�� �����Ͻðڽ��ϱ�?'
    $choices  = '&Y - ��', '&N - �ƴϿ�'
    
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 0)
    if ($decision -eq 0) {
        Write-Host "`n"
        Write-Host "`n"
        Write-Host "�ֵ�� ��ġ�� �����մϴ�."
        Write-Host "`n"
        Write-Host "���� ��ũ��Ʈ ��ġ�� �����մϴ�"
        git clone "https://github.com/mkco5162/AI-WEBUI-scripts-Random" stable-diffusion-webui/extensions/AI-WEBUI-scripts-Random
        git -C stable-diffusion-webui/extensions/AI-WEBUI-scripts-Random fetch
        Write-Host "`n"
        Write-Host "���̳��� ������Ʈ ��ġ�� �����մϴ�."
        git clone "https://github.com/adieyal/sd-dynamic-prompts" stable-diffusion-webui/extensions/sd-dynamic-prompts
        git -C stable-diffusion-webui/extensions/sd-dynamic-prompts fetch
        Write-Host "`n"
        Write-Host "�ڵ� �±׿ϼ� ��ġ�� �����մϴ�."
        git clone "https://github.com/DominikDoom/a1111-sd-webui-tagcomplete" stable-diffusion-webui/extensions/tag-autocomplete
        git -C stable-diffusion-webui/extensions/tag-autocomplete fetch
        Write-Host "`n"
        Write-Host "�̹��� ������ ��ġ�� �����մϴ�."
        git clone "https://github.com/yfszzx/stable-diffusion-webui-images-browser" stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser
        git -C stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser fetch
        Write-Host "`n"
        Write-Host "�ѱ���ġ ��ġ�� �����մϴ�."
        git clone "https://github.com/36DB/stable-diffusion-webui-localization-ko_KR.git" stable-diffusion-webui/extensions/stable-diffusion-webui-localization-ko_KR
        git -C stable-diffusion-webui/extensions/stable-diffusion-webui-localization-ko_KR fetch
        Write-Host "`n"

    } else {
        Write-Host "`n"
        Write-Host "�ֵ�� ��ġ�� �����մϴ�."
        Write-Host "`n"
    }
}


function make-bat {
    Write-Host "����� ������ �����մϴ�"
    Write-Host "`n"
    Write-Host "`n"
    Set-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx �̻�).bat' '@echo off'
    Add-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx �̻�).bat' ''
    Add-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx �̻�).bat' 'set PYTHON='
    Add-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx �̻�).bat' 'set GIT='
    Add-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx �̻�).bat' 'set VENV_DIR='
    Add-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx �̻�).bat' 'set COMMANDLINE_ARGS=--xformers --deepdanbooru --autolaunch'
    Add-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx �̻�).bat' ''
    Add-content '.\stable-diffusion-webui\webui-user-xformers(RTX-1xxx �̻�).bat' 'call webui.bat'


    Set-content '.\stable-diffusion-webui\webui-user-������.bat' '@echo off'
    Add-content '.\stable-diffusion-webui\webui-user-������.bat' ''
    Add-content '.\stable-diffusion-webui\webui-user-������.bat' 'set PYTHON='
    Add-content '.\stable-diffusion-webui\webui-user-������.bat' 'set GIT='
    Add-content '.\stable-diffusion-webui\webui-user-������.bat' 'set VENV_DIR='
    Add-content '.\stable-diffusion-webui\webui-user-������.bat' 'set COMMANDLINE_ARGS=--skip-torch-cuda-test --no-half --precision=full --lowvram --deepdanbooru --autolaunch'
    Add-content '.\stable-diffusion-webui\webui-user-������.bat' ''
    Add-content '.\stable-diffusion-webui\webui-user-������.bat' 'call webui.bat'


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
    Write-Host "WEB UI ��ġ �� ������ �����մϴ�."
    Write-Host "Torch �� Torchvision��Ű���� ��ġ�� �ð��� ���� �ҿ�Ǵ� �������� ��ٷ��ּ���"
    Write-Host "`n"
    Write-Host "`n"
    Write-Host "���� ���ට ���ʹ� " -nonewline; Write-Host "stable-diffusion-webui ����" -ForegroundColor "Cyan" -nonewline; Write-Host " �ȿ� �ִ�" -nonewline; Write-Host " webui-user.bat" -ForegroundColor "Cyan" -nonewline; Write-Host "���� �������ֽñ� �ٶ��ϴ�."
    cd stable-diffusion-webui
    cmd.exe /c '.\webui-user.bat'
}

Write-Host "Version: 0.66.2"
Write-Host "WEB UI ��ġ �� �н����� ������ �����մϴ�."
Write-Host "`n"
cmd.exe /c pause
Write-Host "`n"
Install-git-repo
ask-what-tar
install-settings
install-addon
make-bat
run
cmd.exe /c pause
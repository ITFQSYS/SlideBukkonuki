@echo off

rem bukkonuki�̃��b�p�[�X�N���v�g�A�o�C�i���Ɠ����f�B���N�g���ɓ���Ă�������
rem D&D�ł�ł�񂱂݂����Ȋ����ɂ�����

rem D&D���ꂽ�p�X�̃o�b�N�X���b�V�����X���b�V���ɒu��
set dropped_path=%1
set input_path=%dropped_path:\=/%

rem ���̓p�X�ʒm
echo ���̓p�X�� %input_path%

rem �t�@�C���������ɏo�̓t�H���_�쐬
set filename_origin=%~n1

rem �X�y�[�X�̍폜
set filename_del_1bytespace=%filename_origin: =_%
set filename_del_2bytespace=%filename_del_1bytespace:�@=_%
set dirname=%filename_del_2bytespace%

rem �J�����g�f�B���N�g�����擾
set bat_dir=%~dp0
set bat_path=%bat_dir:\=/%

rem �o�̓t�H���_����������Ă��Ȃ���ΐ���
If NOT EXIST "%bat_path%slides"\ (
mkdir "%bat_path%slides" > NUL 2>&1
)

If NOT EXIST "%bat_path%slides\%dirname%"\ (
mkdir "%bat_path%slides\%dirname%"
)

set  output_path="%bat_path%slides/%dirname%/"

rem �o�̓p�X�ʒm
echo �o�̓p�X�� %output_path%


rem �X���C�h�̃A�X�y�N�g�������
set aspect=
set /P aspect="������X���C�h�̉�ʔ�́H(4:3(�����`�ɋ߂�)�Ȃ�0 / 16:9�Ȃ�1)�F"

rem Auto���[�h�ɂ��邩
choice /m "�S�ăf�t�H���g�ݒ�ŏ������܂���?"

if errorlevel 2 goto :manual
if errorlevel 1 goto :auto

:auto
set trimming=0
set threshold=10
set interval=5

rem �Ԃ����ʂ����s
call %bat_path%bin\Slidebukkonuki.exe %input_path% %output_path% %threshold% %trimming% %aspect% %interval% 
exit /b

:manual
rem �g���~���O�w��
set trimming=
set /P trimming="�g���~���O���܂����H(�f�t�H���g�Ȃ�0)�F"

rem 臒l�w��
set threshold=
set /P threshold="臒l���w�肵�܂���?(�f�t�H���g�Ȃ�10)�F"

rem �t���[���擾�Ԋu
set interval=
set /P interval="�t���[���擾�Ԋu��ύX���܂����H(�f�t�H���g�Ȃ�5)�F"

rem �Ԃ����ʂ����s
cd %~dp0
call %bat_path%bin\Slidebukkonuki.exe %input_path% %output_path% %threshold% %trimming% %aspect% %interval% 

exit /b


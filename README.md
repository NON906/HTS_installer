# HTS_installer

Open JTalk�ȂǂŎg�p�����A�������f���t�@�C���ihtkvoice�j�𐶐��A����т��̊����\�z����V�F���X�N���v�g�ł��B
�i���F���̃X�N���v�g�����s����ƁA�����I�ɂ������̃v���O�������_�E�����[�h����܂��B
�����̃v���O�����̃��C�Z���X�E�g�p�����ɂ��ẮA���ꂼ��̃v���O�������Q�Ƃ��Ă��������j

## �����

Ubuntu 16.04

## �C���X�g�[�����@

1. �ȉ��̃T�C�g�� Stable release (3.4.1) �� Linux/Unix downloads �� HTK source code ���� HTK-3.4.1.tar.gz ���_�E�����[�h���Ă��������B
[http://htk.eng.cam.ac.uk/download.shtml](http://htk.eng.cam.ac.uk/download.shtml)
�i�_�E�����[�h�ɂ̓��[�U�[�o�^���K�v�ł��j

2. �ȉ��̃T�C�g�� HDecode Download Stable Release (3.4.1) �� Linux/Unix downloads ���� HDecode-3.4.1.tar.gz ���_�E�����[�h���Ă��������B
[http://htk.eng.cam.ac.uk/prot-docs/hdecode.shtml](http://htk.eng.cam.ac.uk/prot-docs/hdecode.shtml)
�i�_�E�����[�h�ɂ̓��[�U�[�o�^���K�v�ł��j

3. git clone���܂��B
```
git clone https://github.com/NON906/HTS_installer.git
```

4. �ȉ��̃R�}���h�ŃC���X�g�[�����܂��B
```
cd HTS_installer/scripts
sh install.sh /path/to/HTK-3.4.1.tar.gz /path/to/HDecode-3.4.1.tar.gz
```
�i /path/to/ �ɂ� HTK-3.4.1.tar.gz �� HDecode-3.4.1.tar.gz ���_�E�����[�h�����f�B���N�g�����w�肵�Ă��������j
�i�C���X�g�[���ɂ͐����Ԓ��x������܂��j

## ���s���@

```
cd HTS_installer/scripts
sh make_htsvoice.sh �����t�@�C���̃f�B���N�g�� /path/to/result.htsvoice
```
�i�����t�@�C���̃f�B���N�g�� �Ƃ́A�����ƂȂ�wav��mp3�������Ă���f�B���N�g���̂��Ƃł��j
�i���������������f���t�@�C���� /path/to/result.htsvoice �ɕۑ�����܂��j
�i���s���͑����̃������̈���g�p���܂��̂ŁA���炩����swap�t�@�C����ǉ����Ă������Ƃ��������߂��܂��j
�i�����܂Ő����ԁ`�������x������܂��j

FROM xieshang1111/auto_spy
WORKDIR ./
RUN bash <(curl -s -L https://raw.githubusercontent.com/xieshang/AutoSpy/master/spy_update.sh) \
    cp auto_spy.yaml auto_spy.yaml \
    pip uninstall telethon -y \
    pip install telethon==1.24.0

USER root



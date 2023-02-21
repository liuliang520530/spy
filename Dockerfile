FROM xieshang1111/auto_spy:x86
WORKDIR ./
RUN bash <(curl -s -L https://raw.githubusercontent.com/xieshang/AutoSpy/master/spy_update.sh) \
    cp auto_spy.yaml auto_spy.yaml \

USER root

CMD ['python3','auto_spy_bot.py']



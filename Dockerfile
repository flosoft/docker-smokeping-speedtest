FROM linuxserver/smokeping:latest

# Install speedtest-cli and it's dependencies
RUN apk add python --no-cache \
    && curl -L -o /usr/share/perl5/vendor_perl/Smokeping/probes/speedtest.pm https://github.com/mad-ady/smokeping-speedtest/raw/master/speedtest.pm \
    && curl -L -o /usr/local/bin/speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py \
    && chmod a+x /usr/local/bin/speedtest-cli \
    && curl -L -o /usr/share/perl5/vendor_perl/Smokeping/probes/speedtestcli.pm https://raw.githubusercontent.com/flosoft/smokeping-speedtest/master/speedtestcli.pm \
    && curl -L -o /tmp/speedtestcli.tar.gz https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-1.0.0-x86_64-linux.tgz \
    && tar -xvzf /tmp/speedtestcli.tar.gz \
    && mv speedtest /usr/local/bin/ookla-speedtest

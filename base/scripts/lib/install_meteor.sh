set -e

# meteor installer doesn't work with the default tar binary
RUN apt-get install -y bsdtar \
    && cp $(which tar) $(which tar)~ \
    && ln -sf $(which bsdtar) $(which tar)

curl -sL https://install.meteor.com | sed s/--progress-bar/-sL/g | /bin/sh

# put back the original tar
RUN mv $(which tar)~ $(which tar)

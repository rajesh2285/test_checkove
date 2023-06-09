FROM registry.ford.com/gcprelease/terraform-image:1.0.7 As checkov-image

ARG CHECKOV_VERSION=1.0.5

ENV \
    HOME=/opt/app-root \
    USER_NAME=default \
    USER_UID=1001 \
    SUMMARY="Checkov Tekton Image." \
    DESCRIPTION="Checkov container that builds a basic Checkov cli."

USER 0

LABEL \
    summary='$SUMMARY' \
    description='$DESCRIPTION' \
    io.k8s.description='$DESCRIPTION' \
    io.k8s.display-name="checkov-image" \
    org.label-schema.version="$VERSION" \
    org.label-schema.name="gcp/checkov-image" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.vcs-url=$VCS_URL \
    org.label-schema.vcs-ref=$VCS_REF \
    maintainer="gcprt@groups.ford.com" \
    ford.created-by="mmart852" \
    ford.name="checkov-image" \
    ford.app.powershell="true" \
    ford.app.powershell7="true" \
    ford.app.terraform="true"

RUN microdnf install unzip python39 vim

RUN pip3 install checkov
#&& pip3 install -U requests[security]

WORKDIR ${HOME} 

USER 1001

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["/usr/bin/bash"]
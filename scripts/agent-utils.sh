# ! /usr/bin/bash
# utility calls to get different data from assisted service
if [[ -f ~/workdir-ocp4-agent/.openshift_install_state.json ]]; then
    export SERVER_IP=$(cat ~/workdir-ocp4-agent/rendezvousIP)
    export API_TOKEN=$(sed  's/"\*/"/g' ~/workdir-ocp4-agent/.openshift_install_state.json | jq -r '."gencrypto.AuthConfig".AgentAuthToken')
else
    echo "Could not found ABI working directory"
    exit 1
fi

./ai-utils.sh $*

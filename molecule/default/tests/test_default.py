"""Module containing the tests for the default scenario."""

# Standard Python Libraries
import os

# Third-Party Libraries
import pytest
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("all")


def test_tanium_installed(host):
    """Test that TaniumClient was installed."""
    dir_full_path = "/opt/Tanium/TaniumClient"
    directory = host.file(dir_full_path)
    assert directory.exists
    assert directory.is_directory
    # Make sure that the directory is not empty
    assert host.run_expect([0], f'[ -n "$(ls -A {dir_full_path})" ]')


def test_tanium_enabled(host):
    """Test that TaniumClient is enabled."""
    assert host.service("taniumclient").is_enabled


@pytest.mark.parametrize(
    "key, value",
    [("ServerName", "tanium.example.com"), ("ServerPort", "17472")],
)
def test_tanium_config(host, key, value):
    """Test that TaniumClient is configured."""
    assert value in host.check_output(
        f"/opt/Tanium/TaniumClient/TaniumClient config get {key}"
    )

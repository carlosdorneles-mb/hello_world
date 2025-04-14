from pytest_mock import MockerFixture

from hello_world.main import hello_world


async def test_should_validate_that_th_function_returns_the_correct_message(mocker: MockerFixture):
    mock_logger = mocker.patch("hello_world.main.logger")

    assert await hello_world() == "Hello, World!"
    mock_logger.info.assert_called_once_with("Hello, World!")

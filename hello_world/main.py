from logging import Logger, getLogger

logger: Logger = getLogger(__name__)

__all__ = ["hello_world"]


async def hello_world() -> str:
    """
    A simple function that returns a greeting message.

    Returns:
        str: A greeting message.

    Examples:
        >>> hello_world()
        'Hello, World!'
    """
    logger.info("Hello, World!")
    return "Hello, World!"

package com.neu.movie.exception;

public class BusiException extends RuntimeException {


    public BusiException() {
        super();
    }


    public BusiException(String message) {
        super(message);
    }

    public BusiException(String message, Throwable cause) {
        super(message, cause);
    }

    public BusiException(Throwable cause) {
        super(cause);
    }
}

package com.coders.laundry.common.validation;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Repeatable;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Documented
@Target(FIELD)
@Retention(RUNTIME)
@Repeatable(ValidEnum.List.class)
@Constraint(validatedBy = {EnumValidator.class})
public @interface ValidEnum {

    String message() default "{javax.validation.constraints.Enum.message}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    Class<? extends Enum<?>> enumClass();

    @Documented
    @Target(FIELD)
    @Retention(RUNTIME)
    @interface List {
        ValidEnum[] value();
    }
}

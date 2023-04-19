import { Type } from '@nestjs/common';
import { ArgsType, Field } from '@nestjs/graphql';
import { Type as TransformerType } from 'class-transformer';
import { ValidateNested } from 'class-validator';

export interface IResolverParamsType<T> {
  params: T;
}

export interface IResolverParamsNullableType<T> {
  params?: T;
}

export function ResolverParams<T>(
  classRef: Type<T> | Array<any>,
): Type<IResolverParamsType<T>> {
  @ArgsType()
  abstract class ResolverParamsType implements IResolverParamsType<T> {
    @TransformerType(() => (Array.isArray(classRef) ? classRef[0] : classRef))
    @ValidateNested({ each: true })
    @Field(() => classRef)
    params: T;
  }

  return ResolverParamsType as Type<IResolverParamsType<T>>;
}

export function ResolverParamsNullable<T>(
  classRef: Type<T> | Array<any>,
): Type<IResolverParamsNullableType<T>> {
  @ArgsType()
  abstract class ResolverParamsType implements IResolverParamsNullableType<T> {
    @Field(() => classRef, { nullable: true, defaultValue: {} })
    params?: T;
  }

  return ResolverParamsType as Type<IResolverParamsNullableType<T>>;
}

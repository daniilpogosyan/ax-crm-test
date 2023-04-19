import { Type } from '@nestjs/common';
import { ArgsType, Field, InputType, Int, ObjectType } from '@nestjs/graphql';

export interface IPaginatedType<T> {
  data: T[];
  cursor?: string;
  totalCount: number;
  hasMore: boolean;
}

export interface IFPaginateType<T> extends IPaginatedType<T> {
  restrictedKeys: string[];
}

export function Paginated<T>(classRef: Type<T>): Type<IPaginatedType<T>> {
  @ObjectType({ isAbstract: true })
  abstract class PaginatedType implements IPaginatedType<T> {
    @Field(() => [classRef])
    data: T[];

    @Field(() => String, { nullable: true })
    cursor?: string;

    @Field(() => Int)
    totalCount: number;

    @Field(() => Boolean)
    hasMore: boolean;
  }

  return PaginatedType as Type<IPaginatedType<T>>;
}

export function FPaginated<T>(classRef: Type<T>): Type<IFPaginateType<T>> {
  @ObjectType({ isAbstract: true })
  abstract class FPaginatedType implements IFPaginateType<T> {
    @Field(() => [classRef])
    data: T[];

    @Field(() => String, { nullable: true })
    cursor?: string;

    @Field(() => Int)
    totalCount: number;

    @Field(() => Boolean)
    hasMore: boolean;

    @Field(() => [String])
    restrictedKeys: string[];
  }

  return FPaginatedType as Type<IFPaginateType<T>>;
}

@InputType()
export class PaginationInput {
  @Field(() => Int, { nullable: true, defaultValue: 10 })
  take?: number;

  @Field(() => String, { nullable: true })
  cursor?: string;
}

@ArgsType()
export class PaginationArgs {
  @Field(() => PaginationInput, { defaultValue: {} })
  pagination?: PaginationInput;
}

import { Field, Int, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class ColorModel {
  @Field(() => Int)
  id!: number;

  @Field(() => String)
  title!: string;

  @Field(() => String)
  main!: string;

  @Field(() => String, { nullable: true })
  secondary!: string | null;
}

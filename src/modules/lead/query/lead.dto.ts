import { ResolverParams } from '@common/models/params';
import { InputType, ArgsType, Field, Int } from '@nestjs/graphql';

@InputType()
export class FetchLeadInput {
  @Field(() => Int)
  id: number;
}

@ArgsType()
export class FetchLeadArgs extends ResolverParams(FetchLeadInput) {}

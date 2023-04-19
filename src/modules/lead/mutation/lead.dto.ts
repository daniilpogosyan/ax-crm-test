import { ResolverParams } from '@common/models/params';
import { ArgsType, Field, InputType, Int } from '@nestjs/graphql';

@InputType()
export class CreateLeadInput {
  @Field(() => String)
  firstName: string;
}

@ArgsType()
export class CreateLeadArgs extends ResolverParams(CreateLeadInput) {}

@InputType()
export class UpdateLeadInput {
  @Field(() => Int)
  leadId: number;

  @Field(() => String)
  firstName: string;
}

@ArgsType()
export class UpdateLeadArgs extends ResolverParams(UpdateLeadInput) {}

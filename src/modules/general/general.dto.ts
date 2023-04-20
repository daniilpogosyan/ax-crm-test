import { IsString } from 'class-validator';

export class CreateCandidate {
  @IsString()
  name: string;

  @IsString()
  password: string;
}

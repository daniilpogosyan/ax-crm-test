import { Injectable } from '@nestjs/common';
import { CreateLeadInput } from './dto/create-lead.input';
import { UpdateLeadInput } from './dto/update-lead.input';

@Injectable()
export class LeadService {
  create(createLeadInput: CreateLeadInput) {
    return 'This action adds a new lead';
  }

  findAll() {
    return `This action returns all lead`;
  }

  findOne(id: number) {
    return `This action returns a #${id} lead`;
  }

  update(id: number, updateLeadInput: UpdateLeadInput) {
    return `This action updates a #${id} lead`;
  }

  remove(id: number) {
    return `This action removes a #${id} lead`;
  }
}

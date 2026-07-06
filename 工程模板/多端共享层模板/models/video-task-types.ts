export type VideoTaskStatus = 'draft' | 'pending' | 'generating' | 'completed'

export interface VideoTaskModel {
  id: string
  title: string
  topic: string
  scriptSummary?: string
  storyboardSummary?: string
  status: VideoTaskStatus
  createdAt: string
  updatedAt: string
}

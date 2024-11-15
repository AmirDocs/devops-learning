**WorkFLOWS AKA PIPLELINES**

## **Syntax and structure**:
A workflow file is defined as `.github/workflows`

### **Workflows**:
![Screenshot 2024-11-15 015814](https://github.com/user-attachments/assets/b960fde7-1d6b-4948-86c0-d5dc45bf9a83)
- **Name**: The name of your workflow.
- **Triggers**: Events that trigger the workflow (e.g., push, pull request)
- **Jobs**: Tasks that run in the workflow.
- **Steps**: Individual commands or actions within a job.

### **Events, jobs and steps**:
![Screenshot 2024-11-15 021324](https://github.com/user-attachments/assets/6c2ebf93-f66e-4479-aa95-6fc2d7803c04)
- **Events**: Actions that trigger workflows (e.g., push, pull request, schedule).
- **Jobs**: Independent tasks that run in parallel or sequentially. Each job runs on a virtual machine.
- **Steps** Individual commands or actions executed in a job. Steps run sequentially within a job.
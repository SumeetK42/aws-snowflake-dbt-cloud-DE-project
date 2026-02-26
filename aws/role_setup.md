
# 🔐 AWS IAM Role Setup – SnowflakeS3AccessRole

## 1️⃣ Role Name

* **Role Name:** `SnowflakeS3AccessRole`
* **Purpose:** Enable secure cross-account access to Amazon S3.

---

## 2️⃣ Policy Attached

| Policy Name            | Type               | Attached Entity       |
| ---------------------- | ------------------ | --------------------- |
| AmazonS3ReadOnlyAccess | AWS Managed Policy | SnowflakeS3AccessRole |

This grants read-only access to S3 (`s3:GetObject`, `s3:ListBucket`).

---

## 3️⃣ Trust Relationship

The role trust relationship allows Snowflake to assume the role using the provided IAM ARN and External ID.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::<snowflake-account-id>:user/<snowflake-user>"
            },
            "Action": "sts:AssumeRole",
            "Condition": {
                "StringEquals": {
                    "sts:ExternalId": "<external_id_provided_by_snowflake>"
                }
            }
        }
    ]
}
```



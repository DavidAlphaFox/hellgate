-ifndef(__hellgate_payment_events__).
-define(__hellgate_payment_events__, 42).

%% Payments

-define(payment_started(Payment),
    {invoice_payment_started,
        #payproc_InvoicePaymentStarted{payment = Payment}
    }
).
-define(payment_started(Payment, RiskScore, Route, CashFlow),
    {invoice_payment_started,
        #payproc_InvoicePaymentStarted{
            payment = Payment,
            risk_score = RiskScore,
            route = Route,
            cash_flow = CashFlow
        }
    }
).
-define(payment_status_changed(Status),
    {invoice_payment_status_changed,
        #payproc_InvoicePaymentStatusChanged{status = Status}
    }
).

-define(pending(),
    {pending, #domain_InvoicePaymentPending{}}).
-define(processed(),
    {processed, #domain_InvoicePaymentProcessed{}}).
-define(captured(),
    {captured, #domain_InvoicePaymentCaptured{}}).
-define(failed(Failure),
    {failed, #domain_InvoicePaymentFailed{failure = Failure}}).

%% Sessions

-define(session_ev(Target, Payload),
    {invoice_payment_session_change, #payproc_InvoicePaymentSessionChange{
        target = Target,
        payload = Payload
    }}
).

-define(session_started(),
    {invoice_payment_session_started,
        #payproc_InvoicePaymentSessionStarted{}
    }
).
-define(session_finished(Result),
    {invoice_payment_session_finished,
        #payproc_InvoicePaymentSessionFinished{result = Result}
    }
).
-define(session_suspended(),
    {invoice_payment_session_suspended,
        #payproc_InvoicePaymentSessionSuspended{}
    }
).
-define(session_activated(),
    {invoice_payment_session_activated,
        #payproc_InvoicePaymentSessionActivated{}
    }
).
-define(trx_bound(Trx),
    {invoice_payment_session_transaction_bound,
        #payproc_InvoicePaymentSessionTransactionBound{trx = Trx}
    }
).
-define(proxy_st_changed(ProxySt),
    {invoice_payment_session_proxy_state_changed,
        #payproc_InvoicePaymentSessionProxyStateChanged{proxy_state = ProxySt}
    }
).
-define(interaction_requested(UserInteraction),
    {invoice_payment_session_interaction_requested,
        #payproc_InvoicePaymentSessionInteractionRequested{interaction = UserInteraction}
    }
).

-define(session_succeeded(),
    {succeeded, #payproc_SessionSucceeded{}}
).
-define(session_failed(Failure),
    {failed, #payproc_SessionFailed{failure = Failure}}
).

%% Adjustments

-define(adjustment_ev(AdjustmentID, Payload),
    {invoice_payment_adjustment_change, #payproc_InvoicePaymentAdjustmentChange{
        id = AdjustmentID,
        payload = Payload
    }}
).

-define(adjustment_created(Adjustment),
    {invoice_payment_adjustment_created,
        #payproc_InvoicePaymentAdjustmentCreated{adjustment = Adjustment}
    }
).

-define(adjustment_status_changed(Status),
    {invoice_payment_adjustment_status_changed,
        #payproc_InvoicePaymentAdjustmentStatusChanged{status = Status}
    }
).

-define(adjustment_pending(),
    {pending, #domain_InvoicePaymentAdjustmentPending{}}).
-define(adjustment_captured(At),
    {captured, #domain_InvoicePaymentAdjustmentCaptured{at = At}}).
-define(adjustment_cancelled(At),
    {cancelled, #domain_InvoicePaymentAdjustmentCancelled{at = At}}).

-endif.
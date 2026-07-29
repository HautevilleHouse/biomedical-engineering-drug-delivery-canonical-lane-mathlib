import canonicalLaneMathlib.AdmissibleClass

/-!
# Drug Release Kinetics Package

This module defines drug release models (e.g., zero-order, first-order, Higuchi, Korsmeyer-Peppas).
-/

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

inductive ReleaseModel
  | zeroOrder
  | firstOrder
  | higuchi
  | korsmeyerPeppas
  | weibull

structure DrugReleaseKineticsPackage where
  model : ReleaseModel
  releaseRateConstant : ℝ
  exponent : ℝ
  maximumRelease : ℝ
  timeToRelease : ℝ → ℝ
  modelFitGood : Prop
  cumulativeReleaseBounded : Prop

structure DrugReleaseKineticsEvidence (R : DrugReleaseKineticsPackage) where
  modelFitGoodClosed : R.modelFitGood
  cumulativeReleaseBoundedClosed : R.cumulativeReleaseBounded

def DrugReleaseKineticsClosed (R : DrugReleaseKineticsPackage) : Prop :=
  R.modelFitGood ∧ R.cumulativeReleaseBounded

theorem drug_release_kinetics_closed_from_evidence (R : DrugReleaseKineticsPackage)
    (E : DrugReleaseKineticsEvidence R) : DrugReleaseKineticsClosed R := by
  exact And.intro E.modelFitGoodClosed E.cumulativeReleaseBoundedClosed

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse